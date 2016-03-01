Ruby on Rails
Agile CRM Ruby API 
=================

[Agile CRM] (https://www.agilecrm.com/) is a new breed CRM software with sales and marketing automation.

Table of contents
---------------

**[Intro](#intro)**

**[Requirements](#requirements)**

**[1 Contact](#1-contact)**
  * [1.1 To create a contact](#11-to-create-a-contact)
  * [1.2 To fetch contact data](#12-to-fetch-contact-data)
  * [1.3 To delete a contact](#13-to-delete-a-contact)
  * [1.4 To update a contact](#14-to-update-a-contact)
  * [1.5 Update properties of a contact (partial update)](#15-update-properties-of-a-contact-partial-update)best to use against update contact :+1:
  * [1.6 Update star value](#16-update-star-value)
  * [1.7 Update lead score](#17-update-lead-score)
  * [1.8 Update tags by contact id](#18-update-tags-by-contact-id)
  * [1.9 Adding Tags to a contact based on Email](#19-adding-tags-to-a-contact-based-on-email)
  * [1.10 Delete Tags to a contact based on Email](#110-delete-tags-to-a-contact-based-on-email)

**[2. Company](#2-company)**
  * [2.1 To create a company](#21-to-create-a-company)
  * [2.2 To get a company](#22-to-get-a-company)
  * [2.3 To delete a company](#23-to-delete-a-company)
  * [2.4 To update a company](#24-to-update-a-company)
  * [2.5 Update properties of a company (partial update)](#25-update-properties-of-a-company-partial-update)best to use against update company :+1:
  * [2.6 Update star value of a company](#26-update-star-value-of-a-company)
  * [2.7 Get list of companies](#27-get-list-of-companies)
  * [2.8 Search Contacts/Companies](#28-search-contactscompanies)

**[3. Deal (Opportunity)](#3-deal-opportunity)**
  * [3.1 To create a deal](#31-to-create-a-deal)
  * [3.2 To get a deal](#32-to-get-a-deal)
  * [3.3 To delete a deal](#33-to-delete-a-deal)
  * [3.4 To update deal](#34-to-update-deal)
  * [3.5 To update deal (Partial update)](#35-to-update-deal-partial-update)best to use against update deal :+1:
  * [3.6 Get deals related to specific contact by contact id](#36-get-deals-related-to-specific-contact-by-contact-id)

**[4. Note](#4-note)**
  * [4.1 To create a note](#41-to-create-a-note)
  * [4.2 To get all notes related to specific contact](#42-to-get-all-notes-related-to-specific-contact)
  * [4.3 To update a note](#43-to-update-a-note)
  
**[5. Task](#5-task)**
  * [5.1 To create a task](#51-to-create-a-task)
  * [5.2 To get a task](#52-to-get-a-task)
  * [5.3 To delete a task](#53-to-delete-a-task)
  * [5.4 To update a task](#54-to-update-a-task)

**[6. Event](#6-event)**
  * [6.1 To create a event](#61-to-create-a-event)
  * [6.2 To delete a event](#62-to-delete-a-event)
  * [6.3 To update a event](#63-to-update-a-event)

**[7. Deal Tracks and Milestones](#7-deal-tracks-and-milestones)**
  * [7.1 To create a track](#71-to-create-a-track)
  * [7.2 To get all tracks](#72-to-get-all-tracks)
  * [7.3 To update track](#73-to-update-track)
  * [7.4 To delete a track](#74-to-delete-a-track)

##Intro

1. Fill in your **api_key**, **domain**, **email** in [**agilecrm.rb**](https://github.com/agilecrm/ruby-on-rails/blob/master/agilecrm.rb).

2. Copy and paste the code from below to agilecrm.rb which you want to test. For test purpose contact's all test case copied in agilecrm.rb file all ready, Just uncomment the code want to test.

3. You need to provide 3 paramaters to the agilecrm.rb function. They are **method**, **api path**, **content data**.

##Requirements

- Install Ruby latest version
- agilecrm.rb file

## 1. Contact

#### 1.1 To create a contact

```json
contact_data = {
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
}
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

```javascript

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

## 2. Company

#### 2.1 To create a company

```javascript
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

```javascript
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

#### 2.8 Search Contacts/Companies

- 'q' - Search keyword (all contact/company default fields and searchable custom fields will be searched)
- 'page_size' - Number of results to fetch
- 'type' - Should be 'PERSON' for searching Contacts and 'COMPANY' for Companies

```javascript

$companies = curl_wrap("search?q=Google&page_size=10&type='COMPANY'", null, "GET", "application/json");
print(AgileCRM.request :get, "search?q=Google&page_size=10&type='COMPANY'", nil)
```

## 3. Deal (Opportunity)

- **Note** Milestone name is case sensitive. It should be exactly as in your Agile CRM

#### 3.1 To create a deal

```javascript
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

```javascript
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
