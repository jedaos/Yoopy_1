class Slot extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      buttonClass: 'btn-floating btn-large'
    }
  }


  handleClick(e){
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
        console.log("Worked", response);
        localStorage.setItem('buttonClass', 'btn-floating btn-large disabled');
        this.setState({
          buttonClass: 'btn-floating btn-large disabled'
        });
      },
      error: (response) => {
        console.log(response);
      }
    })
  }

  render () {
    return (
      <div>
      <button className={this.state.buttonClass} id={this.props.slot.id} onClick={this.handleClick.bind(this)}>Reserve This Slot</button>
    </div>)
  }

}

Slot.propTypes = {
  jobId: PropTypes.number,
  slot: PropTypes.object
};
