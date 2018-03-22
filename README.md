本镜像安装有: 

* truffle
* ganache-cli

truffle unbox react 之后的代码在 `src/payroll` 下：

##### 运行容器:

`sh manager.sh run` 容器在后台运行

##### 附加到容器

`sh manager attach` 

##### 停止容器

`sh manager stop` 

##### 运行

```
cp payroll
# 首次需 compile
truffle compile
npm run start
```
