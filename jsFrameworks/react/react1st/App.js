import React from 'react';
import ReactDOM from 'react-dom';

const HOC = (InnerComponent) => class extends React.Component {
  render() {
    return (
      <InnerComponent {...this.props} />
    )
  }
}

// higher order Component

class App extends React.Component {
  render() {
    return (
      <div>
        <Button>Button</Button>
        <hr/>
        <LabelHOC>Label</LabelHOC>
      </div>
    )
  }
}

const Button = HOC((props) => <button>{ props.children }</button>)

class Label extends React.Component {
  render(){
    return (
      <label>{ this.props.children }</label>
    )
  }
}

const LabelHOC = HOC(Label)



  // resuable Component example

  // class App extends React.Component {
  //
  //   constructor() {
  //     super()
  //     this.state = {
  //       red: 0,
  //     }
  //     this.update = this.update.bind(this)
  //   }
  //
  //   update(e) {
  //     this.setState({
  //       red: ReactDOM.findDOMNode(this.refs.red.refs.inp).value
  //     })
  //   }
  //
  //   render() {
  //     return (
  //       <div>
  //         <NumInput ref="red"
  //                   update={ this.update }
  //                   min={0}
  //                   max={255}
  //                   step={1}
  //                   val={+this.state.red}
  //                   type="range"
  //                   label="red"/>
  //         <Button>I <Heart /> React</Button>
  //       </div>
  //     )
  //   }
  // }
  //
  // class NumInput extends React.Component {
  //   render() {
  //     let label = this.props.label !== '' ?
  //       <label>{ this.props.label } - {this.props.val }</label> : ''
  //     return (
  //       <div>
  //         <input ref="inp"
  //           type={this.props.type}
  //           min={this.props.min}
  //           max={this.props.max}
  //           step={this.props.step}
  //           onChange={this.props.update}/>
  //           {label}
  //       </div>
  //     )
  //   }
  // }
  //
  // NumInput.propTypes = {
  //   min: React.PropTypes.number,
  //   max: React.PropTypes.number,
  //   step: React.PropTypes.number,
  //   val: React.PropTypes.number,
  //   label: React.PropTypes.string,
  //   update: React.PropTypes.func.isRequired,
  //   type: React.PropTypes.oneOf(['number', 'range'])
  // }
  //
  // NumInput.defaultProps = {
  //   min: 0,
  //   max: 0,
  //   step: 1,
  //   val: 0,
  //   label:'',
  //   type:'range'
  // }







  // class Button extends React.Component {
  //   render() {
  //     return <button>{ this.props.children }</button>
  //   }
  // }
  //
  // const Heart = () => <span className="glyphicon glyphicon-heart"></span>
  //
  // class Slider extends React.Component {
  //   render(){
  //     return (
  //       <div>
  //           <input type="range" ref="inp" min="0" max="255" onChange={ this.props.update } />
  //       </div>
  //     )
  //   }
  // }
  //
  // // stateless function Component
  //
  // const Widget = (props) => {
  //   return (
  //     <div>
  //         <input type="text" onChange={ props.update } />
  //         <h1>{props.txt}</h1>
  //     </div>
  //   )
  // }
  //
  // App.propTypes = {
  //   txt: React.PropTypes.string,
  //   cat: React.PropTypes.number.isRequired
  // }
  //
  // App.defaultProps = {
  //   txt: 'this is the default txt'
  // }
  //
  // ReactDOM.render(
  //   <App cat={5} />,
  //   document.getElementById('app')
  // );

  export default App
