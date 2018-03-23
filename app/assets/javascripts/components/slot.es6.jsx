class Slot extends React.Component {
  constructor(props){
    super(props)

  }
  handleClick(){


    $.ajax({
      method: 'POST',
      url: `/booking`,
      dataType: 'json',
      data: {slot_id: this.props.slot.id, job_id: this.props.jobId},
      success: (response) => {
        console.log("Worked", response);
      },
      error: (response) => {
        console.log(response);
      }
    })
  }
  render () {
    return (<div>

        <button onClick={this.handleClick.bind(this)} />

    </div>);
  }
}

Slot.propTypes = {
  jobId: PropTypes.number,
  slot: PropTypes.object
};
