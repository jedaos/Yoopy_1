class FriendJob extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      editing: false,
      name: this.props.job.name,
      description: this.props.job.description,
      rate: this.props.job.rate
    }
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleClick = this.handleClick.bind(this)
    this.handleNameChange = this.handleNameChange.bind(this)
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this)
    this.handleRateChange = this.handleRateChange.bind(this)
    this.handleDelete = this.handleDelete.bind(this)
  }

  handleClick(e){
    this.setState({
      editing: !this.state.editing,
      name: e.target.value,
      description: e.target.value,
      rate: e.target.value
    })
  }
  handleNameChange(e){
    let name = e.target.value
    this.setState(prevState => ({
      ...prevState.name,
      name: name
    }))
  }
  handleDescriptionChange(e){
    let description = e.target.value
    this.setState(prevState => ({
      ...prevState.description,
      description: description
    }))
  }
  handleRateChange(e){
    let rate = e.target.value
    this.setState(prevState => ({
      ...prevState.rate,
      rate: rate
    }))
  }
  handleSubmit(e){
    $.ajax({
      url: `/friend_jobs/${this.props.job.id}`,
      method: "PUT",
      dataType: 'json',
      data: {
        friendJob: {
        name: this.state.name,
        description: this.state.description,
        rate: this.state.rate
      }},
      success: (data) => {
        console.log(data);
      },
      error: (response) => {
        console.log("Error", response);
      }
    });
    e.preventDefault();
  }

  handleDelete(){    
    return this.props.onDelete(this.props.job)
  }

  render () {
    let descriptionStyle = {
      height: '75',
      overflow: 'scroll'
    }
    return (
      <div key={this.props.job.id}>
        <form>
          <div className="container">
            <div className="input-field col s3">
              <input
                defaultValue={this.props.job.name}
                onClick={this.handleClick}
                onChange={this.handleNameChange}
                />
            </div>
            <div className="input-field col s3">
              <input
                defaultValue={"$" + this.props.job.rate}
                onClick={this.handleClick}
                onChange={this.handleRateChange}
                />
            </div>
            <div className="input-field col s3">
              <textarea
                defaultValue={this.props.job.description}
                onClick={this.handleClick}
                onChange={this.handleDescriptionChange}
                style={descriptionStyle}
                />
            </div>
            <button onClick={this.handleSubmit} type="Submit" className="btn btn-primary green">Update</button>
            <button onClick={this.handleDelete} type = "Submit" className="btn btn-primary green">Delete</button>
          </div>
        </form>
      </div>

    );
  }
}
