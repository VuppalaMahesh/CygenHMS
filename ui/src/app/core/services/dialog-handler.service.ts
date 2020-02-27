import { Injectable } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material';
import { YesNoDialogComponent } from '../components/yes-no-dialog/yes-no-dialog.component';
import { DialogInput } from '../models/dialog-input';
import { PurchaseOrderProductsDialogComponent } from '../components/purchase-order-products-dialog/purchase-order-products-dialog.component';
import { ProductOrder } from 'src/app/inventory/models/purchase-order';

@Injectable({
  providedIn: 'root'
})
export class DialogHandlerService {

  constructor(public dialog: MatDialog) { }

  public openYesOrNoDialog(dialogInput: DialogInput, callbackFunction: any, ) {
    const defaultConfig: MatDialogConfig = {
      minWidth: '225px',
      minHeight: '100px',
      data: dialogInput
    };
    const dialogRef = this.dialog.open(YesNoDialogComponent, defaultConfig);
    dialogRef.afterClosed().subscribe(result => {
      console.log(result);
      if (result === 'YES') {
        callbackFunction();
      }
    });
  }

  public displayProductsInPurchaseOrder(orderList: Array<ProductOrder>) {
    const defaultConfig: MatDialogConfig = {
      minWidth: '1000px',
      minHeight: '100px',
      data: {
        header: 'Product List',
        orders: orderList
      }
    };
    this.dialog.open(PurchaseOrderProductsDialogComponent, defaultConfig);
  }

}
