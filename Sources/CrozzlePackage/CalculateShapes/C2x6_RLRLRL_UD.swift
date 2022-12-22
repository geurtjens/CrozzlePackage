public class C2x6_RLRLRL_UD {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 2
        let interlockHeight = 6
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
            }

            for up1 in 0..<wordCount {

                if (W.Len[up1] >= interlockHeight) {
                    //print("up1:\(W.Start[up1])")

                    for right1 in 0..<wordCount {

                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.End[up1][5] &&
                            W.Id[right1] != W.Id[up1]) {
                            //print("right1:\(W.Start[right1])")

                            for down2 in 0..<wordCount {

                                if (W.Len[down2] >= interlockHeight &&
                                    W.Start[down2][0] == W.Start[right1][1] &&
                                    W.Id[down2] != W.Id[right1] &&
                                    W.Id[down2] != W.Id[up1]) {
                                    //print("down2:\(W.Start[down2])")

                                    for left2 in 0..<wordCount {

                                        if (W.Len[left2] >= interlockWidth &&
                                            W.End[left2][1] == W.End[up1][4] &&
                                            W.End[left2][0] == W.Start[down2][1] &&
                                            W.Id[left2] != W.Id[down2] &&
                                            W.Id[left2] != W.Id[right1] &&
                                            W.Id[left2] != W.Id[up1]) {
                                            //print("left2:\(W.Start[left2])")

                                            for right3 in 0..<wordCount {

                                                if (W.Len[right3] >= interlockWidth &&
                                                    W.Start[right3][0] == W.End[up1][3] &&
                                                    W.Start[right3][1] == W.Start[down2][2] &&
                                                    W.Id[right3] != W.Id[left2] &&
                                                    W.Id[right3] != W.Id[down2] &&
                                                    W.Id[right3] != W.Id[right1] &&
                                                    W.Id[right3] != W.Id[up1]) {
                                                    //print("right3:\(W.Start[right3])")

                                                    for left4 in 0..<wordCount {

                                                        if (W.Len[left4] >= interlockWidth &&
                                                            W.End[left4][1] == W.End[up1][2] &&
                                                            W.End[left4][0] == W.Start[down2][3] &&
                                                            W.Id[left4] != W.Id[right3] &&
                                                            W.Id[left4] != W.Id[left2] &&
                                                            W.Id[left4] != W.Id[down2] &&
                                                            W.Id[left4] != W.Id[right1] &&
                                                            W.Id[left4] != W.Id[up1]) {
                                                            //print("left4:\(W.Start[left4])")

                                                            for right5 in 0..<wordCount {

                                                                if (W.Len[right5] >= interlockWidth &&
                                                                    W.Start[right5][0] == W.End[up1][1] &&
                                                                    W.Start[right5][1] == W.Start[down2][4] &&
                                                                    W.Id[right5] != W.Id[left4] &&
                                                                    W.Id[right5] != W.Id[right3] &&
                                                                    W.Id[right5] != W.Id[left2] &&
                                                                    W.Id[right5] != W.Id[down2] &&
                                                                    W.Id[right5] != W.Id[right1] &&
                                                                    W.Id[right5] != W.Id[up1]) {
                                                                    //print("right5:\(W.Start[right5])")

                                                                    for left6 in 0..<wordCount {

                                                                        if (W.Len[left6] >= interlockWidth &&
                                                                            W.End[left6][1] == W.End[up1][0] &&
                                                                            W.End[left6][0] == W.Start[down2][5] &&
                                                                            W.Id[left6] != W.Id[right5] &&
                                                                            W.Id[left6] != W.Id[left4] &&
                                                                            W.Id[left6] != W.Id[right3] &&
                                                                            W.Id[left6] != W.Id[left2] &&
                                                                            W.Id[left6] != W.Id[down2] &&
                                                                            W.Id[left6] != W.Id[right1] &&
                                                                            W.Id[left6] != W.Id[up1]) {
                                                                            //print("left6:\(W.Start[left6])")

                                                                            if phase == 0 {
                                                                                shapeCount += 1
                                                                            }
                                                                            else {
                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, left2, right3, left4, right5, left6, up1, down2])

}}}}}}}}}}}}}}}}}}
        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.trailing, .leading, .trailing, .leading, .trailing, .leading],
            patternVertical: [.leading, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }

}