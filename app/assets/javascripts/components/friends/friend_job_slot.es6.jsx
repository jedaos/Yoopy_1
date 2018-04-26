class FriendJobSlot extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      buttonClass: 'btn-large #757575 grey darken-1',
      available: this.props.available
    }

  }
  handleClick(e){
    this.props.available = !this.props.availeble
    $.ajax({
      method: 'POST',
      url: '/bookings',
      dataType: 'json',
      data: {
        booking: {
          slot_id: this.props.id,
          booking_type: this.props.type
        }
      },
      success: (response) => {
        console.log(response);
        this.setState({
          buttonClass: 'btn-large disabled',
          available: !this.state.available

        });

      },
      error: (response) => {
        console.log(response);
      }
    })
  }
  render () {
    if (this.state.available) {
      return (
        <button className={this.state.buttonClass} style={{fontSize: 10}} onClick={this.handleClick.bind(this)}>Reserve</button>
      )
    } else {
      return (
        <p><i className='material-icons'>lock</i></p>
      )
    }
  }
}
