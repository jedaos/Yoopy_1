class NoEditJob extends React.Component {

  render () {

    return(

      <div className="card horizontal" id="job-cards">
        <div className='left' id="job-card-timer">
          <h5>Time Remaining:</h5>
          <span><Timer job={this.props.job.created_at} /></span>
          <ul>
            <li><h5>Rate:</h5></li>
            <p>${this.props.job.rate}0</p>
            <li><h5>Available Openings:</h5></li>
            <p>{this.props.job.slot_num}</p>
          </ul>
        </div>

      <div className='card-content'>
       <ul>
      
         <li><h5>Job Title:</h5></li>
          <p>{this.props.job.name}</p>
         <li><h5>Job Description:</h5></li>
         <p>{this.props.job.description}</p>

         <span id="reserve-buttons">
         {this.props.job.slots.map((slot) => {
           return(<li key={slot.id}>
             <Slot jobId={this.props.job.id} slot={slot} />
           </li>)
         })}
         </span>

       </ul>
      </div>

     </div>

    );
  }
}

NoEditJob.propTypes = {
  jobs: PropTypes.array,
  slots: PropTypes.array
};
