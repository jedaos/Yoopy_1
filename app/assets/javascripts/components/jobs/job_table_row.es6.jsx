
class JobTableRow extends React.Component {
  render () {
    const { name, description, rate, slots, id } = this.props;
    let url = `/jobs/${id}/edit`
    return (
        <tr id="edit-job-row">
          <td>{name}</td>
          <td>{description}</td>
          <td>{rate}</td>
          <td>{slots}</td>
          <td><a href={url} id="editButton" data-remote="true"><i className="material-icons">edit</i></a></td>
        </tr>
    );
  }
}

JobTableRow.propTypes = {
  name: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  rate: PropTypes.string.isRequired,
  slots: PropTypes.string.isRequired
}
