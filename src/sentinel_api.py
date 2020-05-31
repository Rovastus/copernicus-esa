from src.constant import CONFIGURATION_DATA_PATH

def get_sentinel_api():
    #set login and password from yaml file
    username = ''
    password = ''

    with open(CONFIGURATION_DATA_PATH) as f:
        import yaml 
        data = yaml.load(f, Loader=yaml.FullLoader)
        username = data['copernicus'][0]['name']
        password = data['copernicus'][1]['password']

    if not username or not password:
        raise Exception('Problem with loading username or password correctly.')

    from sentinelsat.sentinel import SentinelAPI
    return SentinelAPI(username, password, 'https://scihub.copernicus.eu/dhus')