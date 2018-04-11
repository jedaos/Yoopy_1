class NewFriendJob extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      job: {
        name: '',
        description: '',
        rate: '',
      }
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
      data: {friendJob: this.state.job},
      success: (data) => {
        console.log("Success", data);
        this.setState({
          job: data
        })
        this.props.onNewJob(data);
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

  render () {
    const job = this.state.job;

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
<<<<<<< HEAD:app/assets/javascripts/components/friends/new_friend_job.es6.jsx
                  value={job.name}
                  placeholder="Title"
=======
                  value={this.state.name}
                  placeholder="Job Title"
>>>>>>> eda3519a45711814cf428397881993166cf222e2:app/assets/javascripts/components/new_friend_job.es6.jsx
                  >
                </input>
              </div>
            </div>

            <div className="right-align">
              <div className="input-field col s6">
                <div className="col s6">
<<<<<<< HEAD:app/assets/javascripts/components/friends/new_friend_job.es6.jsx
                  <select className="browser-default" value={job.rate} onChange={this.handleRateChange}>
                    <option value="Rate" className="disabled">Rate</option>
=======
                  <select className="browser-default" value={this.state.rate} onChange={this.handleRateChange}>
                    <option value="Rate" className="disabled">Select Rate</option>
>>>>>>> eda3519a45711814cf428397881993166cf222e2:app/assets/javascripts/components/new_friend_job.es6.jsx
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
<<<<<<< HEAD:app/assets/javascripts/components/friends/new_friend_job.es6.jsx
                    value={job.description}
                    placeholder="Description"
=======
                    value={this.state.description}
                    placeholder="Tell us what type of care you're looking for"
>>>>>>> eda3519a45711814cf428397881993166cf222e2:app/assets/javascripts/components/new_friend_job.es6.jsx
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
