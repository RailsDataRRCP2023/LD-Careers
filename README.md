# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

```mermaid
classDiagram
    class Customer {
        +id: int
        -first_name: string
        -last_name: string
        -email: string
        -phone: string
    }

    class Order {
        +id: int
        -order_date: date
        -total_cents: int
        -status: string
        -customer_id: int
    }

    class OrderItem {
        +id: int
        -quantity: int
        -unit_price_cents: int
        -order_id: int
        -product_id: int
    }

    class Product {
        +id: int
        -name: string
        -description: string
        -price_cents: int
        -remaining_stock: int
        -image_url: string
        -category_id: int
    }

    class Category {
        +id: int
        -category_name: string
        -description: string
    }

    class Payment {
        +id: int
        -payment_date: date
        -amount_cents: int
        -status: string
        -order_id: int
        -payment_method: int
    }

    class PaymentMethod {
        +id: int
        -name: string
        -card_number: string
        -expiration_date: date
        -cvv: string
        -customer_id: int
    }

    Customer -- Order : places
    Order -- OrderItem : contains
    Order -- Payment : initiates
    Product -- OrderItem : comprises
    Category -- Product : contains
    PaymentMethod -- Payment : uses

```