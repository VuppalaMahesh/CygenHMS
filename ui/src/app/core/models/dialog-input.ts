import { ProductOrder } from 'src/app/inventory/models/purchase-order';

export class DialogInput {
    header: string;
    message: string;
    icon?: string;
}

export class PurchaseOrderPopupInput extends DialogInput {
    orders: Array<ProductOrder>;
}
