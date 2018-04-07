import commands
import time
from threading import Thread

def run_cmd(cmd):
    print cmd
    return commands.getstatusoutput(cmd)

class Lion:

    def request_eth(self, address):
        for i in range(1, 10):
            cmd = "curl 'https://faucet.metamask.io/' --data-binary '%s'" % (address)
            ret, data = run_cmd(cmd)
            print(address, data)

    def run(self):
        threads = []
        address_list = [
            '0xa8e742c6207b50fb71b8b3812d5a8da1a502ee9e',
            '0x14a2e3430de70eedc245db99a38f28d173536921',
            '0x97f1ca7aa4db40b9a4f16854a87171ec4e02850c',
            '0x174549715634042147d85e58e0007a3dc0661517',
            '0xca09597e52ed88589d347e2a13a2d03896a9888d',
            '0xd1ef24a15a7d19f39cf2df85977456f604d6c393',
            '0x12073e601130643c6FB10fcb7Ac280d41F4eb456',
            '0x98c81D50B2c1EA38aFd6140F55C9453A62F92777',
            '0x50be6911035645787562Ff87b0e3CDbe10aB4288',
            '0xac6858c3B692E3965458aC8D458238E1f2f845b5',
            '0x9990528b4733d6Bea8BdD025FE31c84D482694c4',
            '0xDC96DF3d1f7720906282432C088d7D246F6D1702',
            '0x9E1473EB9EeAb44D3a924aEF2F4c15A04Ddf55bD',
            '0x9Ab637DB569F3e4708067EDAa0E9Ae43f581722d',
            '0x560C19334249ce99f9837Dba337033221C0F3959',
            '0x9d9B9DBa76F8c9BD04600c288bbB79f03A8EF6F9' ]
        for address in address_list:
            t = Thread(target=self.request_eth, args=(address, ))
            threads.append(t)
            t.start()

        for t in threads:
            t.join()

if __name__ == '__main__':
    lion = Lion()
    lion.run()