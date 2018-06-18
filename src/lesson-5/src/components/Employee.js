import React, { Component } from 'react'
import { Card, Col, Row, Layout, Alert, message, Button } from 'antd';

import Common from './Common';

class Employer extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {
    this.checkEmployee();
  }

  checkEmployee = () => {
     const {payroll , account , web3} = this.props;
  
     payroll.checkInfo.call({
       from : account
     }).then((result) => {
       console.log('checkEmployee=>余额balance:'+result[0].toNumber() +',可支付次数runawy：'+result[1].toNumber()+',员工人数：'+result[2].toNumber())
       this.setState({
        balance : web3.fromWei(result[0].toNumber()),
        runway : result[1].toNumber(),
        employeeCount : result[2].toNumber()
       });
     });
     web3.eth.getBalance(account, function(error, result){
      console.log("当前账户余额"+web3.fromWei(result));
    });
     payroll.employees.call(account ,{
       from : account
     }).then(result => {
       this.setState({
        salary : web3.fromWei(result[1].toNumber()),
        lastPaidDate :  new Date(result[2].toNumber() * 1000).toString()
       });
     });
  }

  getPaid = () => {
    const {payroll , account} = this.props;
    payroll.getPaid({
      from : account
    }).then((result) =>{
      message.info("支取成功!");
    })
  }

  renderContent() {
    const { salary, lastPaidDate, balance } = this.state;

    if (!salary || salary === '0') {
      return   <Alert message="你不是员工" type="error" showIcon />;
    }

    return (
      <div>
        <Row gutter={16}>
          <Col span={8}>
            <Card title="薪水">{salary} Ether</Card>
          </Col>
          <Col span={8}>
            <Card title="上次支付">{lastPaidDate}</Card>
          </Col>
          <Col span={8}>
            <Card title="帐号金额">{balance} Ether</Card>
          </Col>
        </Row>

        <Button
          type="primary"
          icon="bank"
          onClick={this.getPaid}
        >
          获得酬劳
        </Button>
      </div>
    );
  }

  render() {
    const { account, payroll, web3 } = this.props;

    return (
      <Layout style={{ padding: '0 24px', background: '#fff' }}>
        <Common account={account} payroll={payroll} web3={web3} />
        <h2>个人信息</h2>
        {this.renderContent()}
      </Layout >
    );
  }
}

export default Employer
