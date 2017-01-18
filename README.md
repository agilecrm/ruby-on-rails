Agile CRM Ruby API 
=================

[Agile CRM] (https://www.agilecrm.com/) is a new breed CRM software with sales and marketing automation.

Table of contents
---------------

**[Intro](#intro)**

**[Requirements](#requirements)**

**[1 Contact](#1-contact)**
  * [1 To create a contact](#11-to-create-a-contact)
  * [2 To fetch contact data](#12-to-fetch-contact-data)
  * [3 To delete a contact](#13-to-delete-a-contact)
  * [4 To update a contact](#14-to-update-a-contact)
  * [5 To update star value](#15-to-update-star-value)
  * [6 To update lead score](#16-to-update-lead-score)
  * [7 Update tags by contact id](#17-update-tags-by-contact-id)
  * [8 Delete tags by contact id](#18-delete-tags-by-contact-id)

**[2. Company](#2-company)**
  * [1 To create a company](#21-to-create-a-company)
  * [2 To get a company](#22-to-get-a-company)
  * [3 To delete a company](#23-to-delete-a-company)
  * [4 To update a company](#24-to-update-a-company)
  * [5 Search Contacts/Companies](#28-search-contactscompanies)

**[3. Deal (Opportunity)](#3-deal-opportunity)**
  * [1 To create a deal](#31-to-create-a-deal)
  * [2 To get a deal](#32-to-get-a-deal)
  * [3 To delete a deal](#33-to-delete-a-deal)
  * [4 To update deal](#34-to-update-deal)

##Intro

1. Fill in your **api_key**, **domain**, **email** in [**agilecrm.rb**](https://github.com/agilecrm/ruby-on-rails/blob/master/agilecrm.rb).

2. Copy and paste the code from below to agilecrm.rb which you want to test. For test purpose contact's all test case copied in agilecrm.rb file all ready, Just uncomment the code want to test.

3. You need to provide 3 paramaters to the agilecrm.rb function. They are **method**, **api path**, **content data**.

##Requirements

- Install Ruby latest version
- agilecrm.rb file

## 1. Contact

#### 1.1 To create a contact

- [**About properties JSON**](https://github.com/agilecrm/rest-api/blob/master/README.md#properties-json)

- [**Properties JSON Complete Example**](https://github.com/agilecrm/rest-api/blob/master/README.md#properties-json-complete-example)

- [**Acceptable request representation for contact**](https://github.com/agilecrm/rest-api#acceptable-request-representation)

```json
contact_data = '{
    "star_value": "4",
    "lead_score": "92",
    "tags": [
        "Lead",
        "Likely Buyer"
    ],
    "properties": [
        {
            "type": "SYSTEM",
            "name": "first_name",
            "value": "Los "
        },
        {
            "type": "SYSTEM",
            "name": "last_name",
            "value": "Bruikheilmer"
        },
        {
            "type": "SYSTEM",
            "name": "company",
            "value": "steady.inc"
        },
        {
            "type": "SYSTEM",
            "name": "title",
            "value": "VP Sales"
        },
        {
            "type": "SYSTEM",
            "name": "email",
            "subtype": "work",
            "value": "clinton@walt.ltd  "
        },
        {
            "type": "SYSTEM",
            "name": "address",
            "value": "{\"address\":\"225 George Street\",\"city\":\"NSW\",\"state\":\"Sydney\",\"zip\":\"2000\",\"country\":\"Australia\"}"
        },
        {
            "type": "CUSTOM",
            "name": "My Custom Field",
            "value": "Custom value"
        }
    ]
}'
parsed_contact_data = JSON.parse(contact_data) 
print(AgileCRM.request :post, "contacts", parsed_contact_data) 
```

#### 1.2 To fetch contact data

###### by contact ID

```javascript
print(AgileCRM.request :get, "contacts/5762169748586496", nil)
```
###### by email

```javascript
print(AgileCRM.request :get, "contacts/search/email/tester@agilecrm.com", nil)
```

#### 1.3 To delete a contact

```javascript
print(AgileCRM.request :delete, "contacts/5748927693324288", nil) 
```

#### 1.4 To update a contact

```json

update_contact_data = '{
    "id": "5748927693324288",
    "properties": [
        {
            "type": "SYSTEM",
            "name": "last_name",
            "value": "Lee Chu"
        },
        {
            "type": "CUSTOM",
            "name": "My Custom Field",
            "value": "Custom value chane"
        }
    ]
}'
parsed_update_contact_data = JSON.parse(update_contact_data) 
print(AgileCRM.request :put, "contacts/edit-properties", parsed_update_contact_data) 
```

#### 1.5 To update star value
```json

update_starvalue_data = '{
    "id": "5717446287687680",
    "star_value": 2
}'
parsed_starvalue_data = JSON.parse(update_starvalue_data)
#print(AgileCRM.request :put, "contacts/edit/add-star", parsed_starvalue_data)
```

#### 1.6 To update lead score
```json

update_leadscore_data = '{
    "id": "5717446287687680",
    "lead_score": 20
}'
parsed_leadscore_data = JSON.parse(update_leadscore_data)
#print(AgileCRM.request :put, "contacts/edit/lead-score", parsed_leadscore_data) 
```

#### 1.7 Update tags by contact id
```json

update_tags_data = '{
    "id": "5717446287687680",
    "tags": [
        "test1",
        "test2"
    ]
}'
parsed_tags_data = JSON.parse(update_tags_data)
#print(AgileCRM.request :put, "contacts/edit/tags", parsed_tags_data) 
```

#### 1.8 Delete tags by contact id
```json

delete_tags_data = '{
    "id": "5717446287687680",
    "tags": [
        "test1",
        "test2"
    ]
}'
parsed_deletedcontact_data = JSON.parse(delete_tags_data)
#print(AgileCRM.request :put, "contacts/delete/tags", parsed_deletedcontact_data) 
```

## 2. Company

#### 2.1 To create a company

```json
company_data = '{
    "type": "COMPANY",
    "star_value": 4,
    "lead_score": 120,
    "tags": [
        "Permanent",
        "USA",
        "Hongkong",
        "Japan"
    ],
    "properties": [
        {
            "name": "Company Type",
            "type": "CUSTOM",
            "value": "MNC Inc"
        },
        {
            "type": "SYSTEM",
            "name": "name",
            "value": "Spicejet"
        },
        {
            "type": "SYSTEM",
            "name": "url",
            "value": "http://www.spicejet.com/"
        },
        {
            "name": "email",
            "value": "care@spicejet.com",
            "subtype": ""
        },
        {
            "name": "phone",
            "value": "45500000",
            "subtype": ""
        },
        {
            "name": "website",
            "value": "http://www.linkedin.com/company/agile-crm",
            "subtype": "LINKEDIN"
        },
        {
            "name": "address",
            "value": "{\"address\":\"MS 35, 440 N Wolfe Road\",\"city\":\"Sunnyvale\",\"state\":\"CA\",\"zip\":\"94085\",\"country\":\"US\"}",
            "subtype": "office"
        }
    ]
}'
parsed_company_data = JSON.parse(company_data) 
print(AgileCRM.request :post, "contacts", parsed_company_data) 
```

#### 2.2 To get a company by company ID

```javascript
print(AgileCRM.request :get, "contacts/5762169748586496", nil)
```

#### 2.3 To delete a company

```javascript
print(AgileCRM.request :delete, "contacts/5748927693324288", nil)
```
#### 2.4 To update a company

```json
update_company_data = '{
    "id":5651082298523648,
    "properties": [
        {
            "type": "SYSTEM",
            "name": "name",
            "value": "Spicejet"
        },
        {
            "type": "SYSTEM",
            "name": "url",
            "value": "http://www.spicejet.com/"
        },
        {
            "name": "email",
            "value": "care@spicejet.com  ",
            "subtype": ""
        },
        {
            "name": "phone",
            "value": "45500000",
            "subtype": ""
        },
        {
            "name": "website",
            "value": "http://www.linkedin.com/company/agile-crm",
            "subtype": "LINKEDIN"
        },
        {
            "name": "address",
            "value": "{\"address\":\"MS 35, 440 N Wolfe Road\",\"city\":\"Sunnyvale\",\"state\":\"CA\",\"zip\":\"94085\",\"country\":\"US\"}",
            "subtype": "office"
        }
    ]
}'
parsed_update_company_data = JSON.parse(update_company_data) 
print(AgileCRM.request :put, "contacts/edit-properties", parsed_update_company_data) 
```

#### 2.5 Search Contacts/Companies

- 'q' - Search keyword (all contact/company default fields and searchable custom fields will be searched)
- 'page_size' - Number of results to fetch
- 'type' - Should be 'PERSON' for searching Contacts and 'COMPANY' for Companies

```json

print(AgileCRM.request :get, "search?q=Google&page_size=10&type='COMPANY'", nil)
```

## 3. Deal (Opportunity)

- **Note** Milestone name is case sensitive. It should be exactly as in your Agile CRM

#### 3.1 To create a deal

```json
deal_data = '{
    "name": "Deal-Tomato",
    "expected_value": "500",
    "probability": "75",
    "close_date": 1455042600,
    "milestone": "Proposal",
    "contact_ids": [
        "5705059971104768"
    ],
    "custom_data": [
        {
            "name": "Group Size",
            "value": "10"
        }
    ]
}'
parsed_deal_data = JSON.parse(deal_data) 
print(AgileCRM.request :post, "opportunity", parsed_deal_data)
```
#### 3.2 To get a deal

```javascript
print(AgileCRM.request :get, "opportunity/5743182100824064", nil)
```

#### 3.3 To delete a deal

```javascript
print(AgileCRM.request :delete, "opportunity/5743182100824064", nil)
```

#### 3.4 To update deal

```json
update_deal_data = '{
    "id": "5743182100824064",
    "name": "Deal-Tomato-changed",
    "expected_value": "500",
    "probability": "75",
    "close_date": 1455042600,
    "milestone": "Proposal",
    "contact_ids": [
        "5705059971104768"
    ],
    "custom_data": [
        {
            "name": "Group Size",
            "value": "10"
        }
    ]
}'
parsed_update_deal_data = JSON.parse(update_deal_data) 
print(AgileCRM.request :put, "opportunity/partial-update", parsed_update_deal_data)
```

----
