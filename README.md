# INCOME TAX CALCULATOR (KENYA)

This is a small ruby on rails application that can be used to calculate the PAYE (Income Tax) for Kenyan tax payers.

## Design

The application contains the following models:

1. `TaxBracket` - This contains all of the tax brackets that are defined by the government
1. `Calculation` - Every calculation is stored here. In order to simplify matters, calculations with the same base pay are reused.
1. `CalculationTaxBracket` - This model creates a link between `TaxBracket` and `Calculation`. Each `Calculation` can contain multiple `TaxBrackets`.

#### API

Calculations can be accessed via REST, by using the following syntax:

`https://your_host_name_or_ip:3000/api/v1/calculate_paye?basic_pay=125000` (to calculate tax for an income of 125,000), and the JSON response will be:

```
{
"id": 1,
"basic_pay": "125000.0",
"allowances": "0.0",
"gross_pay": "125000.0",
"taxable_pay": "124800.0",
"tax": "32224.0",
"tax_relief": "2400.0",
"paye": "29824.0",
"nhif": "1700.0",
"nssf": "200.0",
"net_pay": "93276.0",
"created_at": "2022-11-30T12:37:01.966Z",
"updated_at": "2022-11-30T12:37:02.047Z",
"calculation_tax_brackets": [
    {
    "id": 4,
    "calculation_id": 1,
    "tax_bracket_id": 1,
    "amount": "24000.0",
    "rate": "10.0",
    "total": "2400.0",
    "created_at": "2022-11-30T12:40:51.943Z",
    "updated_at": "2022-11-30T12:40:51.943Z",
      "tax_bracket": {
        "id": 1,
        "min": "0.0",
        "max": "24000.0",
        "rate": "10.0",
        "created_at": "2022-11-30T12:34:25.912Z",
        "updated_at": "2022-11-30T12:34:25.912Z"
      }
    },
    ...
  ]
}
```

### Requirements

The following libraries are required:

 - Ruby (2.7.5)
 - PostgreSQL
 - Yarn

### Compiling

In order to compile the application:

- Open your terminal and navigate to the root of the project.
- Run the following commands:
  - `bundle install`
  - `yarn`
  - `rails db:create && rails db:migrate`
- Run `rails s` to start the application. After that, it will be available at `http://127.0.0.1:3000` or `http://your_ip_address:3000`.

### Unit Testing

This application is built using test driven development, and we hope to have all models, controllers and views tested. In order to run all tests, run `rspec`. For file specific tests, run `rspec path/to/file` or `rspec path/to/file:xx` where `xx` is a line number.

### Contribution

PullRequests are welcome.