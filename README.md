# ios-ui-barChart

- 야곰의 오토레이아웃 정복하기 

<img src="https://user-images.githubusercontent.com/26668309/160839111-d369b4e9-f17c-4370-a060-7bf8477e4f91.gif" width = 30%> 


# AutoLayout 

- 스토리보드 구조 

<img src="https://user-images.githubusercontent.com/26668309/160841182-00a09461-54a8-4570-983c-aea277637b9a.png" width = 70%> 


- barHeightConstraints 추가 

```Swift 
    private func addConstraint(){
        barHeightConstraints.forEach { constraint in
            constraint.isActive = false
        }
                
        barHeightConstraints = zip(barHeightMultipliers, barStackView.arrangedSubviews).map({
            $1.heightAnchor.constraint(equalTo: barStackView.heightAnchor, multiplier: $0)
        })
        
        NSLayoutConstraint.activate(barHeightConstraints)
    }

```
