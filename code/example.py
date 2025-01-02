import itertools
import hashlib
from collections import Counter
from multiprocessing import cpu_count
from concurrent.futures import ProcessPoolExecutor
 
def get_username(topic_id, ip):
    """
    Returns a username generated from the given topic ID and IP address.

    Parameters:
    topic_id (str): The topic ID to use for generating the username.
    ip (str): The IP address to use for generating the username.

    Returns:
    str: The username generated from the given topic ID and IP address.
    """
    return hashlib.sha1(f"{topic_id}{ip}".encode('ascii')).hexdigest()[9:13]
 
 
def all_ips():
    """
    Generates all possible IP addresses.

    Yields:
    str: The next IP address in the sequence.
    """
    return (
        f"{ip[0]}.{ip[1]}.{ip[2]}.{ip[3]}"
        for ip in 
        itertools.product(range(256), range(256), range(256), range(256))
    )
 
def get_matching_ips(topic_id, username):
    """
    Returns a list of IP addresses that match the given topic ID and username.

    Parameters:
    topic_id (int): The topic ID to use for generating the usernames to match against.
    username (str): The username to match against.

    Returns:
    List[str]: A list of IP addresses that match the given topic ID and username.
    """
    return [
        ip
        for ip in all_ips()
        if get_username(topic_id, ip) == username
    ]
 
if __name__ == "__main__":
    # The topic ID and username pairs to match against from our example
    cases = [
        (1127272, "824e"),
        (1127329, "607e")
    ]
 
    with ProcessPoolExecutor(max_workers=cpu_count()) as executor:
        # Count the number of occurrences of each IP address that 
        # matches the given topic ID and username pairs using parallel processing
        ip_counts = Counter(itertools.chain.from_iterable(executor.map(get_matching_ips, *zip(*cases))))
        for ip, count in ip_counts.most_common(100):
            print(f"{ip} {count}")
 