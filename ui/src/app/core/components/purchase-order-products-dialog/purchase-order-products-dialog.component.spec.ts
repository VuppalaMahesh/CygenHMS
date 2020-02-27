import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PurchaseOrderProductsDialogComponent } from './purchase-order-products-dialog.component';

describe('PurchaseOrderProductsDialogComponent', () => {
  let component: PurchaseOrderProductsDialogComponent;
  let fixture: ComponentFixture<PurchaseOrderProductsDialogComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PurchaseOrderProductsDialogComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PurchaseOrderProductsDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
