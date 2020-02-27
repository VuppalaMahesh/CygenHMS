import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA, MatTableDataSource } from '@angular/material';
import { DialogInput, PurchaseOrderPopupInput } from '../../models/dialog-input';
import { PurchaseOrderTableInput, ProductOrder } from 'src/app/inventory/models/purchase-order';
import { HttpRequestHandlerService } from '../..';
import { Endpoints } from '../../models/endpoints.enum';
import { HttpResponse } from '@angular/common/http';
import { Vendor } from 'src/app/inventory/models/vendor';
import { forkJoin } from 'rxjs';
import { map } from 'rxjs/operators';
import { Product } from 'src/app/inventory/models/product';

@Component({
  selector: 'app-purchase-order-products-dialog',
  templateUrl: './purchase-order-products-dialog.component.html',
  styleUrls: ['./purchase-order-products-dialog.component.scss']
})
export class PurchaseOrderProductsDialogComponent implements OnInit {

  public tableInput: PurchaseOrderTableInput[] = [];
  displayableList: MatTableDataSource<PurchaseOrderTableInput>;
  public displayedColumns: string[] = ['vendorName', 'productName', 'price', 'quantity', 'productDescription'];

  constructor(public dialogRef: MatDialogRef<PurchaseOrderProductsDialogComponent>,
              @Inject(MAT_DIALOG_DATA) public data: PurchaseOrderPopupInput,
              private httpReqHandlerService: HttpRequestHandlerService) { }

  ngOnInit() {
    this.populateTable();
  }

  private populateTable() {
    if (this.data.orders) {
      this.data.orders.forEach((order) => {
        if (order.productID && order.vendorID) {
          forkJoin([
            this.getVendor(order.vendorID),
            this.getProduct(order.productID)
          ]).subscribe(results => {
            this.tableInput.push({
              vendorName: results[0].body.name,
              productName: results[1].body.name,
              productDescription: results[1].body.description,
              price: results[1].body.price,
              quantity: results[1].body.quantity
            });
            this.displayableList = new MatTableDataSource(this.tableInput);
          });
        }
      });
    }
  }

  private getVendor(vendorID: number) {
    return this.httpReqHandlerService.getItem<Vendor>(Endpoints.vendor, vendorID);
  }

  private getProduct(productID: number) {
    return this.httpReqHandlerService.getItem<Product>(Endpoints.product, productID);
  }

  close(): void {
    this.dialogRef.close();
  }

}
