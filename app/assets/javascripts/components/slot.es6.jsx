class Slot extends React.Component {
  constructor(props){
    super(props)

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
      },
      error: (response) => {
        console.log(response);
      }

    })

  }


  render () {
    return (<div>

        <button id="reserve" className="btn btn-primary" onClick={this.handleClick.bind(this)}>Reserve This Slot</button>

    </div>);
  }

}

Slot.propTypes = {
  jobId: PropTypes.number,
  slot: PropTypes.object
};
