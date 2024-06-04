#!/usr/bin/python3
"""
Script to query a list of all hot posts on a given Reddit subreddit.
"""

import requests


def recurse(subreddit, hot_list=None, after="", count=0):
    """
    Recursively retrieves a list of titles of all hot posts on a given subreddit.

    Args:
        subreddit (str): The name of the subreddit.
        hot_list (list, optional): List to store the post titles. Default is None.
        after (str, optional): Token used for pagination. Default is an empty string.
        count (int, optional): Current count of retrieved posts. Default is 0.

    Returns:
        list: A list of post titles from the hot section of the subreddit.
    """
    if hot_list is None:
        hot_list = []

    # Construct the URL for the subreddit's hot posts in JSON format
    api_url = f"https://www.reddit.com/r/{subreddit}/hot/.json"

    # Define headers for the HTTP request, including a custom User-Agent
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"
    }

    # Define parameters for the request, including pagination and limit
    params = {
        "after": after,
        "count": count,
        "limit": 100
    }

    # Send a GET request to the subreddit's hot posts page with no redirects allowed
    response = requests.get(api_url, headers=headers,
                            params=params, allow_redirects=False)

    # Check if the response status code indicates a not-found error (404)
    if response.status_code == 404:
        return None

    # Parse the JSON response and extract the 'data' section
    try:
        results = response.json().get("data")
    except (ValueError, AttributeError):
        # In case of a JSON decode error or if 'data' key is not present
        return None

    # Extract the 'after' token for pagination and update the post count
    after_token = results.get("after")
    count += results.get("dist")

    # Append post titles to the hot_list
    for post in results.get("children"):
        hot_list.append(post.get("data").get("title"))

    # If there are more posts to retrieve, recursively call the function
    if after_token is not None:
        return recurse(subreddit, hot_list, after_token, count)

    # Return the final list of hot post titles
    return hot_list
