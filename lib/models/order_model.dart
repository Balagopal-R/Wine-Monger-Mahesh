// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    int code;
    String totalNoItems;
    List<Datum> data;

    OrderModel({
        required this.code,
        required this.totalNoItems,
        required this.data,
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        code: json["code"],
        totalNoItems: json["Total_No_Items"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "Total_No_Items": totalNoItems,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String orderId;
    String customerId;
    DateTime orderDt;
    DateTime modDt;
    DtComplete dtComplete;
    String ipAddress;
    String total;
    String balance;
    String orderStatusId;
    String isWholesale;
    String resellerNumber;
    CustomerCompany customerName;
    String customerEmail;
    Phone customerPhone;
    CustomerCompany customerCompany;
    String vlDeliveryStart;
    String vlDeliveryEnd;
    String isComplete;
    String ownerUserId;
    String specialInstructions;
    String isBillAndHold;
    String addToXero;
    XeroReferenceNumber xeroReferenceNumber;
    String isDirectOrder;
    String onlineOrderEntityId;
    Customer customer;
    List<OrderShipment> orderShipments;

    Datum({
        required this.orderId,
        required this.customerId,
        required this.orderDt,
        required this.modDt,
        required this.dtComplete,
        required this.ipAddress,
        required this.total,
        required this.balance,
        required this.orderStatusId,
        required this.isWholesale,
        required this.resellerNumber,
        required this.customerName,
        required this.customerEmail,
        required this.customerPhone,
        required this.customerCompany,
        required this.vlDeliveryStart,
        required this.vlDeliveryEnd,
        required this.isComplete,
        required this.ownerUserId,
        required this.specialInstructions,
        required this.isBillAndHold,
        required this.addToXero,
        required this.xeroReferenceNumber,
        required this.isDirectOrder,
        required this.onlineOrderEntityId,
        required this.customer,
        required this.orderShipments,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderId: json["order_id"],
        customerId: json["customer_id"],
        orderDt: DateTime.parse(json["order_dt"]),
        modDt: DateTime.parse(json["mod_dt"]),
        dtComplete: dtCompleteValues.map[json["dt_complete"]]!,
        ipAddress: json["ip_address"],
        total: json["total"],
        balance: json["balance"],
        orderStatusId: json["order_status_id"],
        isWholesale: json["is_wholesale"],
        resellerNumber: json["reseller_number"],
        customerName: customerCompanyValues.map[json["customer_name"]]!,
        customerEmail: json["customer_email"],
        customerPhone: phoneValues.map[json["customer_phone"]]!,
        customerCompany: customerCompanyValues.map[json["customer_company"]]!,
        vlDeliveryStart: json["vl_delivery_start"],
        vlDeliveryEnd: json["vl_delivery_end"],
        isComplete: json["is_complete"],
        ownerUserId: json["owner_user_id"],
        specialInstructions: json["special_instructions"],
        isBillAndHold: json["is_bill_and_hold"],
        addToXero: json["add_to_xero"],
        xeroReferenceNumber: xeroReferenceNumberValues.map[json["xero_reference_number"]]!,
        isDirectOrder: json["is_direct_order"],
        onlineOrderEntityId: json["online_order_entity_id"],
        customer: Customer.fromJson(json["customer"]),
        orderShipments: List<OrderShipment>.from(json["order_shipments"].map((x) => OrderShipment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "customer_id": customerId,
        "order_dt": orderDt.toIso8601String(),
        "mod_dt": modDt.toIso8601String(),
        "dt_complete": dtCompleteValues.reverse[dtComplete],
        "ip_address": ipAddress,
        "total": total,
        "balance": balance,
        "order_status_id": orderStatusId,
        "is_wholesale": isWholesale,
        "reseller_number": resellerNumber,
        "customer_name": customerCompanyValues.reverse[customerName],
        "customer_email": customerEmail,
        "customer_phone": phoneValues.reverse[customerPhone],
        "customer_company": customerCompanyValues.reverse[customerCompany],
        "vl_delivery_start": vlDeliveryStart,
        "vl_delivery_end": vlDeliveryEnd,
        "is_complete": isComplete,
        "owner_user_id": ownerUserId,
        "special_instructions": specialInstructions,
        "is_bill_and_hold": isBillAndHold,
        "add_to_xero": addToXero,
        "xero_reference_number": xeroReferenceNumberValues.reverse[xeroReferenceNumber],
        "is_direct_order": isDirectOrder,
        "online_order_entity_id": onlineOrderEntityId,
        "customer": customer.toJson(),
        "order_shipments": List<dynamic>.from(orderShipments.map((x) => x.toJson())),
    };
}

class Customer {
    String customerId;
    Title title;
    String fname;
    String lname;
    CustomerCompany companyName;
    CustomerType customerType;
    ContactNames contactNames;
    Dob dob;
    String email;
    String password;
    dynamic customerActivationKey;
    String acceptTa;
    Phone phone;
    String mobile;
    String fax;
    String defaultShippingAddressId;
    String defaultBillingAddressId;
    String defaultPaymentMethodId;
    String defaultWarehouseId;
    String optIn;
    String isWholesale;
    String isDistributor;
    String isWebCustomer;
    String resellerNumber;
    String abcNumber;
    String taxId;
    String isRetail;
    String contactAvailability;
    Notes notes;
    String balance;
    String ownerUserId;
    DtComplete dateCreated;
    String creatorUserId;
    DateTime dateMod;
    String modUserId;
    String legacyId;
    String legacyRetailId;
    String vlDeliveryStart;
    String vlDeliveryEnd;
    String vlDeliveryGroupId;
    String vlCarrierNumber;
    DtComplete vlExportedDate;

    Customer({
        required this.customerId,
        required this.title,
        required this.fname,
        required this.lname,
        required this.companyName,
        required this.customerType,
        required this.contactNames,
        required this.dob,
        required this.email,
        required this.password,
        required this.customerActivationKey,
        required this.acceptTa,
        required this.phone,
        required this.mobile,
        required this.fax,
        required this.defaultShippingAddressId,
        required this.defaultBillingAddressId,
        required this.defaultPaymentMethodId,
        required this.defaultWarehouseId,
        required this.optIn,
        required this.isWholesale,
        required this.isDistributor,
        required this.isWebCustomer,
        required this.resellerNumber,
        required this.abcNumber,
        required this.taxId,
        required this.isRetail,
        required this.contactAvailability,
        required this.notes,
        required this.balance,
        required this.ownerUserId,
        required this.dateCreated,
        required this.creatorUserId,
        required this.dateMod,
        required this.modUserId,
        required this.legacyId,
        required this.legacyRetailId,
        required this.vlDeliveryStart,
        required this.vlDeliveryEnd,
        required this.vlDeliveryGroupId,
        required this.vlCarrierNumber,
        required this.vlExportedDate,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerId: json["customer_id"],
        title: titleValues.map[json["title"]]!,
        fname: json["fname"],
        lname: json["lname"],
        companyName: customerCompanyValues.map[json["company_name"]]!,
        customerType: customerTypeValues.map[json["customer_type"]]!,
        contactNames: contactNamesValues.map[json["contact_names"]]!,
        dob: dobValues.map[json["dob"]]!,
        email: json["email"],
        password: json["password"],
        customerActivationKey: json["customer_activation_key"],
        acceptTa: json["accept_ta"],
        phone: phoneValues.map[json["phone"]]!,
        mobile: json["mobile"],
        fax: json["fax"],
        defaultShippingAddressId: json["default_shipping_address_id"],
        defaultBillingAddressId: json["default_billing_address_id"],
        defaultPaymentMethodId: json["default_payment_method_id"],
        defaultWarehouseId: json["default_warehouse_id"],
        optIn: json["opt_in"],
        isWholesale: json["is_wholesale"],
        isDistributor: json["is_distributor"],
        isWebCustomer: json["is_web_customer"],
        resellerNumber: json["reseller_number"],
        abcNumber: json["abc_number"],
        taxId: json["tax_id"],
        isRetail: json["is_retail"],
        contactAvailability: json["contact_availability"],
        notes: notesValues.map[json["notes"]]!,
        balance: json["balance"],
        ownerUserId: json["owner_user_id"],
        dateCreated: dtCompleteValues.map[json["date_created"]]!,
        creatorUserId: json["creator_user_id"],
        dateMod: DateTime.parse(json["date_mod"]),
        modUserId: json["mod_user_id"],
        legacyId: json["legacy_id"],
        legacyRetailId: json["legacy_retail_id"],
        vlDeliveryStart: json["vl_delivery_start"],
        vlDeliveryEnd: json["vl_delivery_end"],
        vlDeliveryGroupId: json["vl_delivery_group_id"],
        vlCarrierNumber: json["vl_carrier_number"],
        vlExportedDate: dtCompleteValues.map[json["vl_exported_date"]]!,
    );

    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "title": titleValues.reverse[title],
        "fname": fname,
        "lname": lname,
        "company_name": customerCompanyValues.reverse[companyName],
        "customer_type": customerTypeValues.reverse[customerType],
        "contact_names": contactNamesValues.reverse[contactNames],
        "dob": dobValues.reverse[dob],
        "email": email,
        "password": password,
        "customer_activation_key": customerActivationKey,
        "accept_ta": acceptTa,
        "phone": phoneValues.reverse[phone],
        "mobile": mobile,
        "fax": fax,
        "default_shipping_address_id": defaultShippingAddressId,
        "default_billing_address_id": defaultBillingAddressId,
        "default_payment_method_id": defaultPaymentMethodId,
        "default_warehouse_id": defaultWarehouseId,
        "opt_in": optIn,
        "is_wholesale": isWholesale,
        "is_distributor": isDistributor,
        "is_web_customer": isWebCustomer,
        "reseller_number": resellerNumber,
        "abc_number": abcNumber,
        "tax_id": taxId,
        "is_retail": isRetail,
        "contact_availability": contactAvailability,
        "notes": notesValues.reverse[notes],
        "balance": balance,
        "owner_user_id": ownerUserId,
        "date_created": dtCompleteValues.reverse[dateCreated],
        "creator_user_id": creatorUserId,
        "date_mod": dateMod.toIso8601String(),
        "mod_user_id": modUserId,
        "legacy_id": legacyId,
        "legacy_retail_id": legacyRetailId,
        "vl_delivery_start": vlDeliveryStart,
        "vl_delivery_end": vlDeliveryEnd,
        "vl_delivery_group_id": vlDeliveryGroupId,
        "vl_carrier_number": vlCarrierNumber,
        "vl_exported_date": dtCompleteValues.reverse[vlExportedDate],
    };
}

enum CustomerCompany {
    DEREK_S
}

final customerCompanyValues = EnumValues({
    "Derek's": CustomerCompany.DEREK_S
});

enum ContactNames {
    DEREK_EXT_5
}

final contactNamesValues = EnumValues({
    "Derek - ext.5": ContactNames.DEREK_EXT_5
});

enum CustomerType {
    WINE_SHOP
}

final customerTypeValues = EnumValues({
    "wine shop": CustomerType.WINE_SHOP
});

enum DtComplete {
    THE_00000000000000
}

final dtCompleteValues = EnumValues({
    "0000-00-00 00:00:00": DtComplete.THE_00000000000000
});

enum Dob {
    THE_00000000
}

final dobValues = EnumValues({
    "0000-00-00": Dob.THE_00000000
});

enum Notes {
    EH_112806_LEFT_MESSAGE_70806_LEFT_MESSAGE
}

final notesValues = EnumValues({
    "EH 11/28/06....Left message. \u000d\n7.08.06: Left message.": Notes.EH_112806_LEFT_MESSAGE_70806_LEFT_MESSAGE
});

enum Phone {
    THE_6267995252
}

final phoneValues = EnumValues({
    "626.799.5252": Phone.THE_6267995252
});

enum Title {
    NOT_SPECIFIED
}

final titleValues = EnumValues({
    "not specified": Title.NOT_SPECIFIED
});

class OrderShipment {
    String orderShipmentId;
    String orderShipmentStatusId;
    String orderId;
    String preOrderId;
    String inventoryTransferId;
    String warehouseId;
    String orderLineIds;
    String shippingCarrierId;
    String shippingMethodId;
    String shippingCost;
    String productsCharged;
    String shippingCharged;
    String taxCodeDsc;
    String taxRateDsc;
    String taxCharged;
    String totalWeight;
    String totalVolume;
    String volumeUnits;
    String weightUnits;
    String refShippingAddressId;
    String shippingName;
    CustomerCompany shippingCompany;
    ShippingStreetAddress1 shippingStreetAddress1;
    String shippingStreetAddress2;
    ShippingCity shippingCity;
    ShippingState shippingState;
    ShippingCounty shippingCounty;
    ShippingCountry shippingCountry;
    String shippingZipCode;
    String shippingSpecialInstructions;
    String poNumber;
    Dob requestedShipDate;
    String requestedShipVia;
    String isShipped;
    String carrierNumber;
    String dataSubmitted;
    String shippingType;
    String shippingLabel;
    String tjApiLogId;
    dynamic tjDateSubmitted;
    String trackingNumber;
    dynamic shipMentStatus;
    dynamic wareHouseDetails;

    OrderShipment({
        required this.orderShipmentId,
        required this.orderShipmentStatusId,
        required this.orderId,
        required this.preOrderId,
        required this.inventoryTransferId,
        required this.warehouseId,
        required this.orderLineIds,
        required this.shippingCarrierId,
        required this.shippingMethodId,
        required this.shippingCost,
        required this.productsCharged,
        required this.shippingCharged,
        required this.taxCodeDsc,
        required this.taxRateDsc,
        required this.taxCharged,
        required this.totalWeight,
        required this.totalVolume,
        required this.volumeUnits,
        required this.weightUnits,
        required this.refShippingAddressId,
        required this.shippingName,
        required this.shippingCompany,
        required this.shippingStreetAddress1,
        required this.shippingStreetAddress2,
        required this.shippingCity,
        required this.shippingState,
        required this.shippingCounty,
        required this.shippingCountry,
        required this.shippingZipCode,
        required this.shippingSpecialInstructions,
        required this.poNumber,
        required this.requestedShipDate,
        required this.requestedShipVia,
        required this.isShipped,
        required this.carrierNumber,
        required this.dataSubmitted,
        required this.shippingType,
        required this.shippingLabel,
        required this.tjApiLogId,
        required this.tjDateSubmitted,
        required this.trackingNumber,
        required this.shipMentStatus,
        required this.wareHouseDetails,
    });

    factory OrderShipment.fromJson(Map<String, dynamic> json) => OrderShipment(
        orderShipmentId: json["order_shipment_id"],
        orderShipmentStatusId: json["order_shipment_status_id"],
        orderId: json["order_id"],
        preOrderId: json["pre_order_id"],
        inventoryTransferId: json["inventory_transfer_id"],
        warehouseId: json["warehouse_id"],
        orderLineIds: json["order_line_ids"],
        shippingCarrierId: json["shipping_carrier_id"],
        shippingMethodId: json["shipping_method_id"],
        shippingCost: json["shipping_cost"],
        productsCharged: json["products_charged"],
        shippingCharged: json["shipping_charged"],
        taxCodeDsc: json["tax_code_dsc"],
        taxRateDsc: json["tax_rate_dsc"],
        taxCharged: json["tax_charged"],
        totalWeight: json["total_weight"],
        totalVolume: json["total_volume"],
        volumeUnits: json["volume_units"],
        weightUnits: json["weight_units"],
        refShippingAddressId: json["ref_shipping_address_id"],
        shippingName: json["shipping_name"],
        shippingCompany: customerCompanyValues.map[json["shipping_company"]]!,
        shippingStreetAddress1: shippingStreetAddress1Values.map[json["shipping_street_address_1"]]!,
        shippingStreetAddress2: json["shipping_street_address_2"],
        shippingCity: shippingCityValues.map[json["shipping_city"]]!,
        shippingState: shippingStateValues.map[json["shipping_state"]]!,
        shippingCounty: shippingCountyValues.map[json["shipping_county"]]!,
        shippingCountry: shippingCountryValues.map[json["shipping_country"]]!,
        shippingZipCode: json["shipping_zip_code"],
        shippingSpecialInstructions: json["shipping_special_instructions"],
        poNumber: json["po_number"],
        requestedShipDate: dobValues.map[json["requested_ship_date"]]!,
        requestedShipVia: json["requested_ship_via"],
        isShipped: json["is_shipped"],
        carrierNumber: json["carrier_number"],
        dataSubmitted: json["data_submitted"],
        shippingType: json["shipping_type"],
        shippingLabel: json["shipping_label"],
        tjApiLogId: json["tj_api_log_id"],
        tjDateSubmitted: json["tj_date_submitted"],
        trackingNumber: json["tracking_number"],
        shipMentStatus: json["shipMentStatus"],
        wareHouseDetails: json["wareHouseDetails"],
    );

    Map<String, dynamic> toJson() => {
        "order_shipment_id": orderShipmentId,
        "order_shipment_status_id": orderShipmentStatusId,
        "order_id": orderId,
        "pre_order_id": preOrderId,
        "inventory_transfer_id": inventoryTransferId,
        "warehouse_id": warehouseId,
        "order_line_ids": orderLineIds,
        "shipping_carrier_id": shippingCarrierId,
        "shipping_method_id": shippingMethodId,
        "shipping_cost": shippingCost,
        "products_charged": productsCharged,
        "shipping_charged": shippingCharged,
        "tax_code_dsc": taxCodeDsc,
        "tax_rate_dsc": taxRateDsc,
        "tax_charged": taxCharged,
        "total_weight": totalWeight,
        "total_volume": totalVolume,
        "volume_units": volumeUnits,
        "weight_units": weightUnits,
        "ref_shipping_address_id": refShippingAddressId,
        "shipping_name": shippingName,
        "shipping_company": customerCompanyValues.reverse[shippingCompany],
        "shipping_street_address_1": shippingStreetAddress1Values.reverse[shippingStreetAddress1],
        "shipping_street_address_2": shippingStreetAddress2,
        "shipping_city": shippingCityValues.reverse[shippingCity],
        "shipping_state": shippingStateValues.reverse[shippingState],
        "shipping_county": shippingCountyValues.reverse[shippingCounty],
        "shipping_country": shippingCountryValues.reverse[shippingCountry],
        "shipping_zip_code": shippingZipCode,
        "shipping_special_instructions": shippingSpecialInstructions,
        "po_number": poNumber,
        "requested_ship_date": dobValues.reverse[requestedShipDate],
        "requested_ship_via": requestedShipVia,
        "is_shipped": isShipped,
        "carrier_number": carrierNumber,
        "data_submitted": dataSubmitted,
        "shipping_type": shippingType,
        "shipping_label": shippingLabel,
        "tj_api_log_id": tjApiLogId,
        "tj_date_submitted": tjDateSubmitted,
        "tracking_number": trackingNumber,
        "shipMentStatus": shipMentStatus,
        "wareHouseDetails": wareHouseDetails,
    };
}

enum ShippingCity {
    PASADENA
}

final shippingCityValues = EnumValues({
    "Pasadena": ShippingCity.PASADENA
});

enum ShippingCountry {
    UNITED_STATES
}

final shippingCountryValues = EnumValues({
    "United States": ShippingCountry.UNITED_STATES
});

enum ShippingCounty {
    OTHER
}

final shippingCountyValues = EnumValues({
    "Other": ShippingCounty.OTHER
});

enum ShippingState {
    CALIFORNIA
}

final shippingStateValues = EnumValues({
    "California": ShippingState.CALIFORNIA
});

enum ShippingStreetAddress1 {
    THE_181_E_GLENARM_ST
}

final shippingStreetAddress1Values = EnumValues({
    "181 E. Glenarm St.": ShippingStreetAddress1.THE_181_E_GLENARM_ST
});

class WareHouseDetailsClass {
    String warehouseId;
    String warehouseName;
    String contactNames;
    String phone;
    String fax;
    String email;
    String poFromEmail;
    String poToAddresses;
    String notes;
    String warehouseDefaultAddressId;
    String warehouseDefaultUserId;
    String defaultShippingCarrierId;
    String activeTaxCodeId;
    String isDropshipper;
    String isRetail;
    String isWholesale;
    String poNumberBase;
    String formsDirectory;
    String dropShipHandlerIdLive;
    String autoSubmitPo;
    String repNotification;
    String sortOrder;
    String isActive;

    WareHouseDetailsClass({
        required this.warehouseId,
        required this.warehouseName,
        required this.contactNames,
        required this.phone,
        required this.fax,
        required this.email,
        required this.poFromEmail,
        required this.poToAddresses,
        required this.notes,
        required this.warehouseDefaultAddressId,
        required this.warehouseDefaultUserId,
        required this.defaultShippingCarrierId,
        required this.activeTaxCodeId,
        required this.isDropshipper,
        required this.isRetail,
        required this.isWholesale,
        required this.poNumberBase,
        required this.formsDirectory,
        required this.dropShipHandlerIdLive,
        required this.autoSubmitPo,
        required this.repNotification,
        required this.sortOrder,
        required this.isActive,
    });

    factory WareHouseDetailsClass.fromJson(Map<String, dynamic> json) => WareHouseDetailsClass(
        warehouseId: json["warehouse_id"],
        warehouseName: json["warehouse_name"],
        contactNames: json["contact_names"],
        phone: json["phone"],
        fax: json["fax"],
        email: json["email"],
        poFromEmail: json["po_from_email"],
        poToAddresses: json["po_to_addresses"],
        notes: json["notes"],
        warehouseDefaultAddressId: json["warehouse_default_address_id"],
        warehouseDefaultUserId: json["warehouse_default_user_id"],
        defaultShippingCarrierId: json["default_shipping_carrier_id"],
        activeTaxCodeId: json["active_tax_code_id"],
        isDropshipper: json["is_dropshipper"],
        isRetail: json["is_retail"],
        isWholesale: json["is_wholesale"],
        poNumberBase: json["po_number_base"],
        formsDirectory: json["forms_directory"],
        dropShipHandlerIdLive: json["drop_ship_handler_id_live"],
        autoSubmitPo: json["auto_submit_po"],
        repNotification: json["rep_notification"],
        sortOrder: json["sort_order"],
        isActive: json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "warehouse_id": warehouseId,
        "warehouse_name": warehouseName,
        "contact_names": contactNames,
        "phone": phone,
        "fax": fax,
        "email": email,
        "po_from_email": poFromEmail,
        "po_to_addresses": poToAddresses,
        "notes": notes,
        "warehouse_default_address_id": warehouseDefaultAddressId,
        "warehouse_default_user_id": warehouseDefaultUserId,
        "default_shipping_carrier_id": defaultShippingCarrierId,
        "active_tax_code_id": activeTaxCodeId,
        "is_dropshipper": isDropshipper,
        "is_retail": isRetail,
        "is_wholesale": isWholesale,
        "po_number_base": poNumberBase,
        "forms_directory": formsDirectory,
        "drop_ship_handler_id_live": dropShipHandlerIdLive,
        "auto_submit_po": autoSubmitPo,
        "rep_notification": repNotification,
        "sort_order": sortOrder,
        "is_active": isActive,
    };
}

enum XeroReferenceNumber {
    EMPTY
}

final xeroReferenceNumberValues = EnumValues({
    " ": XeroReferenceNumber.EMPTY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
