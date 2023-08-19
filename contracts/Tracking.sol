// SPDX-License-Identifier: MIT
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Tracking{
    enum ShipmentStatus {PENDING , IN_TANSIT , DELIVERED}

    struct Shipment{
        address sender;
        address reciever;
        uint256 pickupTime;
        uint256 deliveryTime;
        uint256 distance;
        uint256 price;
        ShipmentStatus status;
        bool isPaid;
    }

    mapping(address => Shipment[]) public shipments;
    uint256 public ShipmentCount;

    struct TypeShipment{
        address sender;
        address reciever;
        uint256 pickupTime;
        uint256 deliveryTime;
        int256 distance;
        uint256 price;
        ShipmentStatus status;
        bool isPaid;
    }

    TypeShipment[] typeShipments;

    event ShipmentCreated(address indexed sender,address indexed reciever,uint256 pickupTime,uint256 distance,uint256 price);
    event ShipmentInTransit(address)
}