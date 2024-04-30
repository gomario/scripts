from asusrouter import AsusRouter
from asusrouter import AsusData

router = AsusRouter(host = "192.168.2.1",         #required - both IP and URL supported
                    username = "admin",                 #required
                    password = "asuspar454",              #required
                    port = None,                        #optional - default port would be selected based on use_ssl parameter
                    use_ssl = False,                    #optional
                    cache_time = 5)                     #option

ram_info = router.async_get_data(AsusData.RAM, force=False)
# `force` parameter is optional and defaults to False
# If set to True, the library will fetch the data from the router
# regardless of the cache state

print(ram_info)
print("Done")
