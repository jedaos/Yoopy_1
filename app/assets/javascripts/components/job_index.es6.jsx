class AllJobs extends React.Component {
  constructor(props){
    super(props)
  }

  render() {
    return (
        <div>
          <h3>{this.props.owner[0]["hospital"]["institution_name"]}</h3>  
            {this.props.jobs.map((job) => {
              return (<NoEditJob job={job} owner={this.props.owner} key={job.id}/>)
            })}

        </div>

    );
  }
}

AllJobs.propTypes = {
  jobs: PropTypes.array.isRequired,
  owner: PropTypes.array.isRequired
};
