import SwiftUI

struct SCText: View {
    // Core text properties
    var text: String
    var textType: TextType = .body
    var color: TextColor = .black
    var alignment: TextAlignmentType = .leading
    var lineLimit: Int? = nil
    var lineSpacing: LineSpacing = .normal
    var padding: TextPadding = .none
    var background: BackgroundStyle = .none
    var shadow: ShadowStyle = .none
    
    var regexPattern: RegexPattern? = nil
    var highlightColor: TextColor = .black

    var body: some View {
        let highlightedText = applyRegexHighlighting(text: text, regexPattern: regexPattern?.pattern)
        
        HStack {
            ForEach(highlightedText, id: \.self) { segment in
                Text(segment.text)
                    .foregroundColor(segment.isHighlighted ? highlightColor.color : color.color)
                    .font(textType.font)
            }
        }
        .multilineTextAlignment(alignment.value)
        .lineLimit(lineLimit)
        .lineSpacing(lineSpacing.value)
        .padding(padding.value)
        .background(background.color?.cornerRadius(background.cornerRadius))
        .shadow(color: shadow.color, radius: shadow.radius)
    }
    
    private func applyRegexHighlighting(text: String, regexPattern: String?) -> [TextSegment] {
        guard let regexPattern = regexPattern else {
            return [TextSegment(text: text, isHighlighted: false)]
        }
        
        var segments: [TextSegment] = []
        do {
            let regex = try NSRegularExpression(pattern: regexPattern, options: [])
            let matches = regex.matches(in: text, options: [], range: NSRange(text.startIndex..., in: text))
            
            var currentIndex = text.startIndex
            for match in matches {
                let matchRange = Range(match.range, in: text)!
                
                // Add text before the match
                if currentIndex < matchRange.lowerBound {
                    let prefix = String(text[currentIndex..<matchRange.lowerBound])
                    segments.append(TextSegment(text: prefix, isHighlighted: false))
                }
                
                // Add matched text
                let matchText = String(text[matchRange])
                segments.append(TextSegment(text: matchText, isHighlighted: true))
                
                // Update current index
                currentIndex = matchRange.upperBound
            }
            
            // Add remaining text
            if currentIndex < text.endIndex {
                let suffix = String(text[currentIndex..<text.endIndex])
                segments.append(TextSegment(text: suffix, isHighlighted: false))
            }
        } catch {
            segments.append(TextSegment(text: text, isHighlighted: false))
        }
        
        return segments
    }
}

// Text segment structure
struct TextSegment: Hashable {
    let text: String
    let isHighlighted: Bool
}
