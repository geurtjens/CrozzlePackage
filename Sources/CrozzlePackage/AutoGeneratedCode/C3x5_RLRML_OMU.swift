public class C3x5_RLRML_OMU {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 5
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
                outerStart = Array(repeating: 0, count: stride * shapeCount)
            }

            for outery1 in 0..<wordCount {

                if W.Len[outery1] >= interlockHeight + 2 {

                    let outery1Limit = Int(W.Len[outery1]) - Int(interlockHeight)
                    for outery1Pos in 1..<outery1Limit {

                        //print("outery1:\(W.Start[outery1])")

                        for right1 in 0..<wordCount {

                            if (W.Len[right1] >= interlockWidth &&
                                W.Start[right1][0] == W.Start[outery1][outery1Pos + 0] &&
                                W.Id[right1] != W.Id[outery1]) {
                                //print("right1:\(W.Start[right1])")

                                for middley2 in 0..<wordCount {

                                    if (W.Len[middley2] == interlockHeight &&
                                        W.Start[middley2][0] == W.Start[right1][1] &&
                                        W.Id[middley2] != W.Id[right1] &&
                                        W.Id[middley2] != W.Id[outery1]) {
                                        //print("middley2:\(W.Start[middley2])")

                                        for left2 in 0..<wordCount {

                                            if (W.Len[left2] >= interlockWidth &&
                                                W.End[left2][2] == W.Start[outery1][outery1Pos + 1] &&
                                                W.End[left2][1] == W.Start[middley2][1] &&
                                                W.Id[left2] != W.Id[middley2] &&
                                                W.Id[left2] != W.Id[right1] &&
                                                W.Id[left2] != W.Id[outery1]) {
                                                //print("left2:\(W.Start[left2])")

                                                for up3 in 0..<wordCount {

                                                    if (W.Len[up3] >= interlockHeight &&
                                                        W.End[up3][4] == W.Start[right1][2] &&
                                                        W.End[up3][3] == W.End[left2][0] &&
                                                        W.Id[up3] != W.Id[left2] &&
                                                        W.Id[up3] != W.Id[middley2] &&
                                                        W.Id[up3] != W.Id[right1] &&
                                                        W.Id[up3] != W.Id[outery1]) {
                                                        //print("up3:\(W.Start[up3])")

                                                        for right3 in 0..<wordCount {

                                                            if (W.Len[right3] >= interlockWidth &&
                                                                W.Start[right3][0] == W.Start[outery1][outery1Pos + 2] &&
                                                                W.Start[right3][1] == W.Start[middley2][2] &&
                                                                W.Start[right3][2] == W.End[up3][2] &&
                                                                W.Id[right3] != W.Id[up3] &&
                                                                W.Id[right3] != W.Id[left2] &&
                                                                W.Id[right3] != W.Id[middley2] &&
                                                                W.Id[right3] != W.Id[right1] &&
                                                                W.Id[right3] != W.Id[outery1]) {
                                                                //print("right3:\(W.Start[right3])")

                                                                for middlex4 in 0..<wordCount {

                                                                    if (W.Len[middlex4] == interlockWidth &&
                                                                        W.Start[middlex4][0] == W.Start[outery1][outery1Pos + 3] &&
                                                                        W.Start[middlex4][1] == W.Start[middley2][3] &&
                                                                        W.Start[middlex4][2] == W.End[up3][1] &&
                                                                        W.Id[middlex4] != W.Id[right3] &&
                                                                        W.Id[middlex4] != W.Id[up3] &&
                                                                        W.Id[middlex4] != W.Id[left2] &&
                                                                        W.Id[middlex4] != W.Id[middley2] &&
                                                                        W.Id[middlex4] != W.Id[right1] &&
                                                                        W.Id[middlex4] != W.Id[outery1]) {
                                                                        //print("middlex4:\(W.Start[middlex4])")

                                                                        for left5 in 0..<wordCount {

                                                                            if (W.Len[left5] >= interlockWidth &&
                                                                                W.End[left5][2] == W.Start[outery1][outery1Pos + 4] &&
                                                                                W.End[left5][1] == W.Start[middley2][4] &&
                                                                                W.End[left5][0] == W.End[up3][0] &&
                                                                                W.Id[left5] != W.Id[middlex4] &&
                                                                                W.Id[left5] != W.Id[right3] &&
                                                                                W.Id[left5] != W.Id[up3] &&
                                                                                W.Id[left5] != W.Id[left2] &&
                                                                                W.Id[left5] != W.Id[middley2] &&
                                                                                W.Id[left5] != W.Id[right1] &&
                                                                                W.Id[left5] != W.Id[outery1]) {
                                                                                //print("left5:\(W.Start[left5])")

                                                                                if phase == 0 {
                                                                                    shapeCount += 1
                                                                                }
                                                                                else {
                                                                                    outerStart[index + 5] = UInt8(outery1Pos)

                                                                                    ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, left2, right3, middlex4, left5, outery1, middley2, up3])
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.trailing, .leading, .trailing, .middle, .leading],
            patternVertical: [.outer, .middle, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}