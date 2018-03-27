class NoEditJob extends React.Component {

  render () {

    return(

      <div className="card horizontal">

        <Timer job={this.props.job.created_at} />
        
       <ul>

         <li><h5>Title: {this.props.job.name}</h5></li>
         <li><h5>Description: {this.props.job.description}</h5></li>
         <li><h5>Rate: {this.props.job.rate}</h5></li>
         <li><h5>Slots: {this.props.job.slot_num}</h5></li>
         <div className='card-horizontal'>

         {this.props.job.slots.map((slot) => {

           return(<li key={slot.id}>
             <Slot jobId={this.props.job.id} slot={slot} />
           </li>)
         })}

         </div>
       </ul>
     </div>

    );
  }
}

NoEditJob.propTypes = {
  jobs: PropTypes.array,
  slots: PropTypes.array
};
