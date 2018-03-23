class NoEditJob extends React.Component {
  render () {
    return(

      <div className="card horizontal">
       <ul>
         <li><h5>Title: {this.props.job.name}</h5></li>
         <li><h5>Description: {this.props.job.description}</h5></li>
         <li><h5>Rate: {this.props.job.rate}</h5></li>
         <li><h5>Slots: {this.props.job.slot_num}</h5></li>
         
       </ul>
     </div>

    );
  }
}

NoEditJob.propTypes = {
  jobs: PropTypes.array
};
