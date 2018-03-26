class Slot extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      buttonClass: 'btn-floating btn-large',
      available: this.props.slot.available
    }
  }
  handleClick(e){
    this.props.slot.available = !this.props.slot.availeble
    $.ajax({
      method: 'POST',
      url: `/bookings`,
      dataType: 'json',
      data: {
        booking: {
          slot_id: this.props.slot.id,
        }
      },
      success: (response) => {
        console.log(response);
        this.setState({
          buttonClass: 'btn-floating btn-large disabled',
          available: !this.state.available

        });

      },
      error: (response) => {
        console.log(response);
      }
    })
  }

  render () {
    if (this.state.available){
    return(
      <div>


      <button className={this.state.buttonClass} id={this.props.slot.id} onClick={this.handleClick.bind(this)}>Reserve This Slot</button>


    </div>
    )
  } else {
    return(
      <p><i className='material-icons'>lock</i></p>
    )
  }
  }
}

Slot.propTypes = {
  jobId: PropTypes.number,
  slot: PropTypes.object
};
