import UIKit

final class ViewController: UICollectionViewController {
    
    private let pageCount = 5
    
    private var cellSize: CGSize {
        let width = collectionView.bounds.width * 0.8
        let height = width * Cell.aspectRatio
        return CGSize(width: width, height: height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.decelerationRate = .fast
        
        let flowLayout = collectionViewLayout as! FlowLayout
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = cellSize
        flowLayout.minimumInteritemSpacing = collectionView.bounds.height
        flowLayout.minimumLineSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
    }
    
    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return pageCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        cell.label.text = "\(indexPath.row)"
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let collectionView = scrollView as! UICollectionView
        (collectionView.collectionViewLayout as! FlowLayout).prepareForPaging()
    }
}
