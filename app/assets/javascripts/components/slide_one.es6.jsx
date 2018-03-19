const SlideOne= (props) => {
  let background = {
    backgroundImage: 'url(https://images.pexels.com/photos/263402/pexels-photo-263402.jpeg?h=350&dpr=2&auto=compress&cs=tinysrgb)',
    backgroundSize: 'cover',
    backgroundPosition: 'center',
    
  }

  return <div style={background} className="slide"></div>
}
