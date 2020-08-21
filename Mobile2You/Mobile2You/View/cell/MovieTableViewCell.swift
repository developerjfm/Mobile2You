import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var yearMovie: UILabel!
    @IBOutlet weak var genreMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setCellWithValuesOf(_ movie:Movie) {
        self.nameMovie.text = movie.poster_path
        self.yearMovie.text = movie.release_date
       
        var result = ""
            
        if let genres = movie.genres{
            for item in genres {
                if let name = item.name{
                    result = name
                }
            }
        }
      
        
        self.genreMovie.text = result
     
        if let backdrop_path = movie.poster_path{
            let url = URL.init(string:  TheMovieDBAPI.urlImages + ImageSize.poster.rawValue + backdrop_path)
            self.imageView?.sd_setImage(with: url, completed: nil)
        }
    }
}