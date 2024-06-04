#!/usr/bin/python3
"""
This script contains a function that queries the Reddit API to return the
number of subscribers for a given subreddit.
"""

import requests


def number_of_subscribers(subreddit):
    """
    Queries the Reddit API and returns the number of subscribers for the
    given subreddit.

    Parameters:
    subreddit (str): The name of the subreddit to query.

    Returns:
    int: The number of subscribers of the subreddit, or 0 if the subreddit
         is invalid or an error occurs.
    """
    # Construct the URL for the subreddit's about page in JSON format
    api_url = "https://www.reddit.com/r/{}/about.json".format(subreddit)

    # Set a custom User-Agent to avoid rate limiting issues
    headers = {"User-Agent": "Mozilla/5.0"}

    # Make a GET request to the Reddit API with no redirects allowed
    response = requests.get(api_url, headers=headers, allow_redirects=False)

    # Check if the response status code indicates a successful request
    if response.status_code == 200:
        # Parse the JSON response
        data = response.json()
        # Extract the number of subscribers from the response data
        subscriber_count = data['data']['subscribers']
        return subscriber_count
    else:
        # Return 0 if the subreddit is invalid or an error occurs
        return 0
