#!/usr/bin/python3
"""
Script to print the titles of the 10 hottest posts on a given Reddit subreddit.
"""

import requests


def top_ten(subreddit):
    """
    Prints the titles of the 10 hottest posts on a given subreddit.

    Parameters:
    subreddit (str): The name of the subreddit to query.
    """
    # Construct the URL for the subreddit's hot posts in JSON format
    api_url = "https://www.reddit.com/r/{}/hot/.json".format(subreddit)

    # Define headers for the HTTP request, including a custom User-Agent
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"
    }

    # Define parameters for the request, limiting the number of posts to 10
    params = {
        "limit": 10
    }

    """Send a GET request to the subreddit's hot
    posts page with no redirects allowed"""
    response = requests.get(api_url, headers=headers,
                            params=params, allow_redirects=False)

    # Check if the response status code indicates a not-found error (404)
    if response.status_code == 404:
        print("None")
        return

    # Parse the JSON response and extract the 'data' section
    try:
        results = response.json().get("data")
    except (ValueError, AttributeError):
        # In case of a JSON decode error or if 'data' key is not present
        print("None")
        return

    # Check if the results contain 'children' key with posts data
    if results and "children" in results:
        # Print the titles of the top 10 hottest posts
        for post in results.get("children"):
            print(post.get("data").get("title"))
    else:
        print("None")
