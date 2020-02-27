import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule, HttpClientXsrfModule } from '@angular/common/http';
import { FlexLayoutModule } from '@angular/flex-layout';
import { CookieService } from 'ngx-cookie-service';

import { CoreRoutingModule } from './core-routing.module';
import { DialogHandlerService } from './services/dialog-handler.service';
import { HeaderComponent } from './header/header.component';
import { HostComponent } from './host/host.component';
import { MaterialComponentsModule } from '../material-components/material-components.module';
import { NotificationHandlerService } from './services/notification-handler.service';
import { YesNoDialogComponent } from './components/yes-no-dialog/yes-no-dialog.component';
import { PurchaseOrderProductsDialogComponent } from './components/purchase-order-products-dialog/purchase-order-products-dialog.component';

@NgModule({
  declarations: [HeaderComponent, HostComponent, YesNoDialogComponent, PurchaseOrderProductsDialogComponent],
  imports: [
    CommonModule,
    CoreRoutingModule,
    FlexLayoutModule,
    HttpClientModule,
    HttpClientXsrfModule,
    MaterialComponentsModule
  ],
  providers: [
    CookieService,
    NotificationHandlerService,
    DialogHandlerService
  ],
  exports: [
    HeaderComponent,
    HostComponent
  ],
  entryComponents: [
    YesNoDialogComponent,
    PurchaseOrderProductsDialogComponent
  ]
})
export class CoreModule { }
