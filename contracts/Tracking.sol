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
    event ShipmentInTransit(address indexed sender,address indexed reciever,uint256 pickupTime);
    event ShipmentDelivered(address indexed sender,address indexed reciever,uint256 deliveryTime);
    event ShipmentPaid(address indexed sender,address indexed reciever,uint256 amount);

    constructor(){
        ShipmentCount=0;
    }

    function createShipment(address _reciever, uint256 _pickupTime, uint256 _distance, uint256 _price) public payable{
        require(msg.value == _price, "Payment amount must match the price.");

        Shipment memory shipment = Shipment(msg.sender, _reciever, _pickupTime, 0, _distance, _price, ShipmentStatus.PENDING, false);

        shipments[msg.sender].push(shipment);
        shipmentCount++;

            typeShipments.push(
                TypeShipment(
                    msg.sender,
                    _reciever,
                    _pickupTime,
                    0,
                    _distance,
                    _price,
                    ShipmentStatus.PENDING,
                    false
                )
            );

            emit ShipmentCreated(msg.sender, _reciever, _pickupTime, _distance, _price);

            function startShipment(address _sender,address _reciever, uint256 _index) public{
                Shipment storage shipment = shipments[_sender][_index]
            }
    }
}