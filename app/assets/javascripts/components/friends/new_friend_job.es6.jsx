class NewFriendJob extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      job: {
        name: '',
        description: '',
        rate: '',
        slot_num: ''
      }
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
      url: "/friend_jobs",
      method: "POST",
      dataType: "json",
      data: {friendJob: this.state.job},
      success: (data) => {
        console.log("Success", data);
        this.setState({
          job: data
        })
        this.props.onNewJob(data);
        this.setState({
          job: {
            name: '',
            description: '',
            rate: '',
            slot_num: ''
          }
        })
      }
    })

  }
  handleTitleChange(e){
    let name = e.target.value
    this.setState(prevState => ({
        job: {
          ...prevState.job,
        name: name
      }
    }))
  }
  handleDescriptionChange(e){
    let description = e.target.value
    this.setState(prevState => ({
        job: {
          ...prevState.job,
        description: description
      }
    }))
  }
  handleRateChange(e){
    let rate = e.target.value
    this.setState(prevState => ({
        job: {
          ...prevState.job,
        rate: rate
      }
    }))
  }
  handleSlotChange(e){
    let slot_num = e.target.value
    this.setState(prevState => ({
        job: {
          ...prevState.job,
        slot_num: slot_num
      }
    }))
  }

  render () {
    const job = this.state.job;

    return (
    <div className="" id="friendJobForm">
      <div className="row">
        <form className="col s12" onSubmit={this.handleSubmit}>
          <div className="row">

            <div>
              <div className="input-field col s12">
                <input
                  type='text'
                  onChange={this.handleTitleChange}
                  value={job.name}
                  placeholder="Job Name"
                  >
                </input>
              </div>
            </div>
          </div>

          <div className="row">

                  <div className="col s6">
                      <select className="browser-default" value={job.rate} onChange={this.handleRateChange}>
                        <option value="Rate" className="disabled">Rate</option>
                        <option value="100">$100</option>
                        <option value="200">$200</option>
                        <option value="300">$300</option>
                      </select>
                    </div>

                  <div className="col s6">
                      <select className='browser-default' value={job.slot_num} onChange={this.handleSlotChange}>
                        <option value="Slots" className="disabled"> Number of Professionals</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                      </select>
                  </div>

<<<<<<< HEAD
            <div>
              <div className="input-field col s6">
                <div className="">
                  <select className="browser-default" value={job.rate} onChange={this.handleRateChange}>
                    <option value="Rate" className="disabled">Rate</option>
                    <option value="100">$100</option>
                    <option value="200">$200</option>
                    <option value="300">$300</option>
                  </select>
                </div>
              </div>
            </div>

              <div>
                <div className="input-field col s12">
=======
              </div>

            <div className="col s12">
              <div className="row">
                <div className="input-field">
>>>>>>> 8a603b84532fa3ca768838d5fbbc24a8cd46b887
                  <textarea
                    id="description"
                    type='text'
                    onChange={this.handleDescriptionChange}
                    value={job.description}
                    placeholder="Add a description to tell us about the type of medical professional you're looking for"
                    >
                  </textarea>
                </div>
              </div>
<<<<<<< HEAD
=======


          <div className="row">
            <div className="col s1">
              <input className="btn btn-primary" type="submit" value="Submit"></input>
>>>>>>> 8a603b84532fa3ca768838d5fbbc24a8cd46b887
            </div>
            <input className="btn-large green-button" type="submit" value="Post Job"></input>

            </form>
          </div>
<<<<<<< HEAD
        </div>
=======
        </form>
      </div>


>>>>>>> 8a603b84532fa3ca768838d5fbbc24a8cd46b887
    );
  }
}

NewFriendJob.propTypes = {

};
