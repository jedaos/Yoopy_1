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
  }

  handleSubmit(e){
    e.preventDefault()
    $.ajax({
      url: "/friend_jobs",
      method: "POST",
      dataType: "json",
      data: { friendJob:{
        name: this.state.name,
        description: this.state.description,
        rate: this.state.rate,
        friend_id: this.props.owner.id
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

  render () {
    return (
    <div className="center" id="friendJobForm">
      <div className="row">
        <form className="col s12" onSubmit={this.handleSubmit}>
          <div className="row">
            <div className="col s3">
              <div className="input-field col s12">

                <input
                  type='text'
                  onChange={this.handleTitleChange}
                  value={this.state.name}
                  placeholder="Job Title"
                  >
                </input>
              </div>
            </div>

            <div className="right-align">
              <div className="input-field col s6">
                <div className="col s6">
                  <select className="browser-default" value={this.state.rate} onChange={this.handleRateChange}>
                    <option value="Rate" className="disabled">Select Rate</option>
                    <option value="100">$100</option>
                    <option value="200">$200</option>
                    <option value="300">$300</option>
                  </select>
                </div>
              </div>
            </div>
            <div className="col s12">
              <div className="row">
                <div className="input-field">
                  <textarea
                    id="description"
                    type='text'
                    onChange={this.handleDescriptionChange}
                    value={this.state.description}
                    placeholder="Tell us what type of care you're looking for"
                    >
                  </textarea>
                  </div>
                </div>
              </div>
          </div>

          <div className="row">
            <div className="col s">
              <input className="btn-large green-button" type="submit" value="Submit"></input>
            </div>
          </div>
        </form>
      </div>
    </div>
    );
  }
}

NewFriendJob.propTypes = {

};
