##### 运行容器:

`sh manager.sh run` 容器在后台运行

##### 附加到容器

`sh manager attach` 

##### 停止容器

`sh manager stop` 

##### 运行

启动 `ganache-cli`

```
sh manager attach
ganache-cli
```

再开一个终端运行 Web App:

```
sh manager attach
cp payroll
# 首次需 compile 和 migrate
truffle compile
truffle migrate
npm run start
```

http://localhost:3000/
