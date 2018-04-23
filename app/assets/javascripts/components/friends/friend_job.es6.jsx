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
  handleSubmit(e){
    $.ajax({
      url: `/friend_jobs/${this.props.job.id}`,
      method: "PUT",
      dataType: 'json',
      data: {friendJob:{
        name: this.state.name,
        description: this.state.description,
        rate: this.state.rate
      }},
      success(response){
        console.log(response);
      },
      error(response){
        console.log("Error", response);
      }
    });
    e.preventDefault();

  }
  handleDelete(e){
    $.ajax({
      url: `/friend_jobs/${this.props.job.id}`,
      method: "DELETE",
      dataType: 'json',
      data: {friendJob:{
        name: this.state.name,
        description: this.state.description,
        rate: this.state.rate
      }},
      success(response){
        console.log("Success", response);
      },
      error(response){
        console.log("Error", response);
      }
    }
  );
    e.preventDefault();
  }

  render () {
    let descriptionStyle = {
      height: '75',
      overflow: 'scroll'
    }
    return (
      <div>
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
