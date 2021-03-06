import { Component, OnInit, ViewChild } from "@angular/core";
import { MatSort, MatTableDataSource } from "@angular/material";

import { Vendor } from "../../models/vendor";
import { Endpoints } from "src/app/core/models/endpoints.enum";
import { HttpRequestHandlerService, NotificationHandlerService, AppWebUrls } from "src/app/core";
import { HttpResponse } from "@angular/common/http";
import { DialogHandlerService } from 'src/app/core/services/dialog-handler.service';
import { DialogInput } from 'src/app/core/models/dialog-input';

@Component({
  selector: "app-vendor-list",
  templateUrl: "./vendor-list.component.html",
  styleUrls: ["./vendor-list.component.scss"]
})
export class VendorListComponent implements OnInit {
  public appWebUrls = AppWebUrls;
  displayedColumns: string[] = [
    "name",
    "contactName",
    "phoneNumber",
    "email",
    "website",
    "address",
    "actions"
  ];
  vendorDataSource: MatTableDataSource<Vendor>;
  vendorList: Vendor[] = [];
  @ViewChild(MatSort) sort: MatSort;

  constructor(private httpReqHandlerService: HttpRequestHandlerService,
              private notificationHandler: NotificationHandlerService,
              private dialogHandler: DialogHandlerService) {}

  ngOnInit() {
    this.getVendorList();
  }

  applyFilter(filterValue: string) {
    this.vendorDataSource.filter = filterValue.trim().toLowerCase();
  }

  getVendorList() {
    this.httpReqHandlerService
      .get<Vendor[]>(Endpoints.vendors)
      .pipe()
      .subscribe((response: HttpResponse<Vendor[]>) => {
        if (response.ok) {
          this.vendorList = response.body;
          this.vendorDataSource = new MatTableDataSource(this.vendorList);
        }
      });
  }

  public deleteRow(id: number) {
    const dialogInput: DialogInput = {
      header: 'Delete',
      message: 'Sure you want to continue?'
    };
    this.dialogHandler.openYesOrNoDialog(dialogInput, () => {
      this.httpReqHandlerService.delete(`${Endpoints.vendor}${id}/`).subscribe((response: HttpResponse<string>) => {
          if (response.ok) {
              this.getVendorList();
              this.notificationHandler.showNotification(`vendor deleted successfully`);
          }
      });
    });
}
}
