import UIKit

// Custom TableViewCell class
class TransactionCell: UITableViewCell {
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let amountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        titleLabel.textColor = UIColor.black
        
        subtitleLabel.font = UIFont(name: "HelveticaNeue", size: 12)
        subtitleLabel.textColor = UIColor.gray
        
        amountLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        amountLabel.textColor = UIColor.black
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(amountLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            amountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
