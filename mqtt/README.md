# MQTT in Docker

Set up MQTT in Docker. The final goal is to have five instances:

- broker
- subscriber
- publisher
- Node-RED
- Mongodb 

## Phase IoT: all-in-one instance

- broker, subscriber, publisher, Node-RED

## Phase MIO: most-in-one

- public broker
- subscriber, publisher, Node-RED

## Phase one: two instances

- public broker
- subscriber
- publisher

## Phase two: three instances

- broker
- subscriber
- publisher

## Phase three: four instances

- broker
- subscriber
- publisher
- Node-RED

## Phase four: five instances

While this could be set up using a Docker compose file,
the more realistic "in-the-wild" setup would be where each instance is on a different device or system.

For example, 
the broker could be on a VM in the cloud.
The subscriber could be a device ( or devices ) that responds to a message.
The publisher could be a sensor ( or sensors ) in the field.
Node-RED could be on a different server in the cloud, even a different cloud provider from the broker.
MongoDB could be a service provided by a cloud provider.

- broker
- subscriber
- publisher
- Node-RED
- MongoDB


