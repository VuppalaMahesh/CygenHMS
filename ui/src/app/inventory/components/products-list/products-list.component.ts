// Angular imports
import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';

// Custom imports
import { AppWebUrls, Endpoints, HttpRequestHandlerService, NotificationHandlerService } from './../../../core';
import { Product } from '../../models/product';
import { MatTableDataSource } from '@angular/material';
import { DialogHandlerService } from 'src/app/core/services/dialog-handler.service';
import { DialogInput } from 'src/app/core/models/dialog-input';

@Component({
    selector: 'app-products-list',
    templateUrl: './products-list.component.html',
    styleUrls: ['./products-list.component.scss']
})
export class ProductsListComponent implements OnInit {
    public appWebUrls = AppWebUrls;
    private productsList: Product[] = [];
    public displayedColumns: string[] = ['name', 'category', 'quantity', 'price', 'description', 'actionsColumn'];
    public productsDataSource: MatTableDataSource<Product>;
    constructor(
        private httpReqHandlerService: HttpRequestHandlerService,
        private notificationHandler: NotificationHandlerService,
        private dialogHandler: DialogHandlerService
    ) { }

    ngOnInit() {
        this.getProducts();
    }

    private getProducts() {
        this.httpReqHandlerService.get<Product[]>(Endpoints.products).pipe().subscribe((response: HttpResponse<Product[]>) => {
            if (response.ok) {
                this.productsList = response.body;
                this.productsDataSource = new MatTableDataSource(this.productsList);
            }
        });
    }

    public applyFilter(filterValue: string) {
        this.productsDataSource.filter = filterValue.trim().toLowerCase();
    }

    public deleteRow(id: number) {
        const dialogInput: DialogInput = {
            header: 'Delete',
            message: 'Sure you want to continue?'
        };
        this.dialogHandler.openYesOrNoDialog(dialogInput, () => {
            this.httpReqHandlerService.delete(`${Endpoints.product}${id}/`).subscribe((response: HttpResponse<string>) => {
                if (response.ok) {
                    this.getProducts();
                    this.notificationHandler.showNotification(`product deleted successfully`);
                }
            });
        });
    }
}
