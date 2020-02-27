import { Injectable } from '@angular/core';
import { InMemoryDbService } from 'angular-in-memory-web-api'

@Injectable({
    providedIn: 'root'
})
export class DbService implements InMemoryDbService {

    constructor() { }

    createDb() {
        let suppliers = [
            {
                name: "Citrus Ltd",
                phoneNumber: "64564713149749",
                contactPerson: "John Doe",
                address: "#53",
                email: "jhon@admin.com"
            },
            {
                name: "Citrus Ltd",
                phoneNumber: "64564713149749",
                contactPerson: "John Doe",
                address: "#53",
                email: "jhon@admin.com"
            },
            {
                name: "Citrus Ltd",
                phoneNumber: "64564713149749",
                contactPerson: "John Doe",
                address: "#53",
                email: "jhon@admin.com"
            },
            {
                name: "Citrus Ltd",
                phoneNumber: "64564713149749",
                contactPerson: "John Doe",
                address: "#53",
                email: "jhon@admin.com"
            },
            {
                name: "Citrus Ltd",
                phoneNumber: "64564713149749",
                contactPerson: "John Doe",
                address: "ksbdkghkdsgk",
                email: "jhon@admin.com"
            },
            {
                name: "lfhalhflhalh",
                phoneNumber: "lhfslhflhldshl",
                contactPerson: "haj;kfpis;flj",
                address: "jjlajslfjlisjl",
                email: "sflkjsljdflj"
            }
        ]
        return {
            suppliers1: suppliers
        };
    }
}
