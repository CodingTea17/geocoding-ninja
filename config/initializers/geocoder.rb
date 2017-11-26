Geocoder.configure(

    # geocoding service:
    :lookup => :bing,

    # to use an API key:
    :api_key => 'AqINn4H3dL9tN4Lr3WhILS0AnqjuLvueL3-u_6Buln_v9aex5gzW4Bn_agILlqMD',

    # this is very important option for configuring geocoder with API key
    :use_https => true,

    # geocoding service request timeout, in seconds (default 3):
    :timeout => 7,

    # set default units to kilometers:
    :units => :km,
)
