import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';
import { FormBuilderService, HttpRequestHandlerService, Endpoints, NotificationHandlerService } from 'src/app/core';
import { MatTableDataSource } from '@angular/material';
import { PurchaseOrder, PurchaseOrderStatus, ProductOrder } from '../../models/purchase-order';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { DialogInput } from 'src/app/core/models/dialog-input';
import { DialogHandlerService } from 'src/app/core/services/dialog-handler.service';

@Component({
  selector: 'app-purchase-order-list',
  templateUrl: './purchase-order-list.component.html',
  styleUrls: ['./purchase-order-list.component.scss']
})
export class PurchaseOrderListComponent implements OnInit {
  public purchaseOrderListForm: FormGroup;
  public displayedColumns: string[] = ['orderId', 'orderDate', 'requestedDate',
                                       'requestedDepartment', 'purchaseStatus', 'remarks', 'actionsColumn'];
  public purchaseOrdersDataSource: MatTableDataSource<PurchaseOrder>;
  public orderStatus: FormControl = new FormControl('');
  public selectedStatus = '';
  public purchaseOrderStatusValues: string[] = Object.keys(PurchaseOrderStatus);

  private editableRowNumber = -1;

  constructor(private formBuilder: FormBuilderService,
              private httpReqHandlerService: HttpRequestHandlerService,
              private ref: ChangeDetectorRef,
              private notificationHandler: NotificationHandlerService,
              private dialogHandler: DialogHandlerService) { }

  ngOnInit() {
    this.purchaseOrdersDataSource = new MatTableDataSource([]);
    this.getPurchaseOrders();
    this.purchaseOrderListForm = this.formBuilder.createForm<any>({
      orderId: ''
    });
  }

  private getPurchaseOrders() {
    this.httpReqHandlerService.get<PurchaseOrder[]>(Endpoints.purchaseOrders).pipe().subscribe(
      (response: HttpResponse<PurchaseOrder[]>) => {
        if (response.ok) {
          this.purchaseOrdersDataSource = new MatTableDataSource(response.body);
        }
    });
  }

  public isEditable(rowIndex: number) {
    return this.editableRowNumber === rowIndex;
  }

  public editRow(rowIndex: number, purchaseStatus: string) {
    this.editableRowNumber = rowIndex;
    this.selectedStatus = purchaseStatus;
    this.ref.detectChanges();
  }

  public editComplete(id: number, rowIndex: number) {
    this.editableRowNumber = -1;
    const rowData = this.purchaseOrdersDataSource.data[rowIndex] as unknown as PurchaseOrder;
    rowData.purchaseStatus = PurchaseOrderStatus[this.selectedStatus];
    this.httpReqHandlerService.putItem<PurchaseOrder, PurchaseOrder>(Endpoints.purchaseOrder, id, rowData)
    .pipe().subscribe((response: HttpResponse<PurchaseOrder>) => {
      if (response.ok) {
      }
    });
  }

  public deleteRow(id: number) {
    const dialogInput: DialogInput = {
        header: 'Delete',
        message: 'Sure you want to continue?'
    };
    this.dialogHandler.openYesOrNoDialog(dialogInput, () => {
        this.httpReqHandlerService.delete(`${Endpoints.purchaseOrder}${id}/`).subscribe((response: HttpResponse<string>) => {
            if (response.ok) {
                this.getPurchaseOrders();
                this.notificationHandler.showNotification(`product deleted successfully`);
            }
        });
    });
  }

  public applyFilter(filterValue: string) {
    this.purchaseOrdersDataSource.filter = filterValue.trim().toLowerCase();
  }

  public displayProducts(orderList: Array<ProductOrder>) {
    this.dialogHandler.displayProductsInPurchaseOrder(orderList);
  }
}
