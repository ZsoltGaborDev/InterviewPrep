//
//  FakeStoreAPIPrompt.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import Foundation

/*
 Objective:
 
 Build a reusable and extensible data layer for fetching and caching data from the Fake Store API.
 Your solution should handle products and users endpoints, supporting caching with refresh logic and presistence between lanuches
 
 API: https://fakestoreapi.com
 
 Requirements:
  - Create a generic data fetching service to handle multiple API endpoints (e.g. /products, /users).
  - Include cachinig loginc with time-based refresh intervals.
  - Ensure cached data persist between app launches
 
 Data to be displayed:
  - Usa a tab view to display list of prodcts and users
  - Products
    - Image, title and description
    - Description should be limited to two lines
  - Users
    - First and last name
    - email
 
 Functionality:
  - Fetch data for products (/products) and users (/users).
  - Automatically refresh data when cache expires
  - Pull to refresh functionality that invalidates cache and refreshes data
  - Implement error handling
  - List should be searchable
  - This API does not support pagination, but should add pseudo code with comments or print statements to implement it
 
 UI behaviour:
  - Show a loading indicator while data is being fetched.
  - Display an error message if the data fetch fails.
  - Update the UI with fetched data or fallback to cached data if available.
 
 Expectations:
  - Follow SOLID principles to ensure your code is modular and extensible.
  - Use Swift best practices for asyncronous programming (async/await).
  - Write clean, readable and scalabel code.
  - Networking layer needs to be generic and reusable (Senior level)
  
 Deliverables:
  - A fully functional app or module demonstrating the above functionality
  - Example UI displaying products and and users.
 
 Extra Credit:
  - Write unit test with SwiftTesting for your modules
 
 */
