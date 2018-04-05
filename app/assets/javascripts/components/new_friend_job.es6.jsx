class NewFriendJob extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      name: '',
      description: '',
      rate: '',
      slotNum: ''
    }
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleTitleChange = this.handleTitleChange.bind(this)
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this)
    this.handleRateChange = this.handleRateChange.bind(this)
    this.handleSlotChange = this.handleSlotChange.bind(this)
  }

  handleSubmit(e){
    e.preventDefault()
    $.ajax({
      url: "/jobs",
      method: "POST",
      dataType: "json",
      data: { job:{
        name: this.state.name,
        description: this.state.description,
        rate: this.state.rate,
        slot_num: this.state.slotNum,
        hospital_id: this.props.owner.id
      }
    },
      success(response){
        console.log("Success", response);
      }
    })

  }
  handleTitleChange(e){
    this.setState({
      name: e.target.value
    })
  }
  handleDescriptionChange(e){
    this.setState({
      description: e.target.value
    })
  }
  handleRateChange(e){
    this.setState({
      rate: e.target.value
    })
  }
  handleSlotChange(e){
    this.setState({
      slotNum: e.target.value
    })
  }

  render () {
    return (
      <form onSubmit={this.handleSubmit}>
        <div className="input-field col s12">
        <input
          type='text'
          onChange={this.handleTitleChange}
          value={this.state.name}
          placeholder="Title"
          ></input>
        </div>
        <div className="input-field col s12">
          <input
            type='text'
            onChange={this.handleDescriptionChange}
            value={this.state.description}
            placeholder="Description"
          ></input>
        </div>
        <div className="form-group">


            <select className="browser-default" style={{opacity: 1, height: 20, pointerEvents: "all", width: "10%", top: 80}} value={this.state.rate} onChange={this.handleRateChange}>
              <option value="Rate" className="disabled"></option>
              <option value="100">$100</option>
              <option value="200">$200</option>
              <option value="300">$300</option>
            </select>

        </div>
        <div className="form-group">
            <input
              type='integer'
              onChange={this.handleSlotChange}
              value={this.state.slotNum}
              placeholder="Positions"
              ></input>
        </div>
        <input type="submit" value="Submit"></input>
      </form>

    );
  }
}

NewFriendJob.propTypes = {

};
