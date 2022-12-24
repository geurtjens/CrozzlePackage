public class C3x4_RLMR_OMU {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 4
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
                                                        W.End[up3][3] == W.Start[right1][2] &&
                                                        W.End[up3][2] == W.End[left2][0] &&
                                                        W.Id[up3] != W.Id[left2] &&
                                                        W.Id[up3] != W.Id[middley2] &&
                                                        W.Id[up3] != W.Id[right1] &&
                                                        W.Id[up3] != W.Id[outery1]) {
                                                        //print("up3:\(W.Start[up3])")

                                                        for middlex3 in 0..<wordCount {

                                                            if (W.Len[middlex3] == interlockWidth &&
                                                                W.Start[middlex3][0] == W.Start[outery1][outery1Pos + 2] &&
                                                                W.Start[middlex3][1] == W.Start[middley2][2] &&
                                                                W.Start[middlex3][2] == W.End[up3][1] &&
                                                                W.Id[middlex3] != W.Id[up3] &&
                                                                W.Id[middlex3] != W.Id[left2] &&
                                                                W.Id[middlex3] != W.Id[middley2] &&
                                                                W.Id[middlex3] != W.Id[right1] &&
                                                                W.Id[middlex3] != W.Id[outery1]) {
                                                                //print("middlex3:\(W.Start[middlex3])")

                                                                for right4 in 0..<wordCount {

                                                                    if (W.Len[right4] >= interlockWidth &&
                                                                        W.Start[right4][0] == W.Start[outery1][outery1Pos + 3] &&
                                                                        W.Start[right4][1] == W.Start[middley2][3] &&
                                                                        W.Start[right4][2] == W.End[up3][0] &&
                                                                        W.Id[right4] != W.Id[middlex3] &&
                                                                        W.Id[right4] != W.Id[up3] &&
                                                                        W.Id[right4] != W.Id[left2] &&
                                                                        W.Id[right4] != W.Id[middley2] &&
                                                                        W.Id[right4] != W.Id[right1] &&
                                                                        W.Id[right4] != W.Id[outery1]) {
                                                                        //print("right4:\(W.Start[right4])")

                                                                        if phase == 0 {
                                                                            shapeCount += 1
                                                                        }
                                                                        else {
                                                                            outerStart[index + 4] = UInt8(outery1Pos)

                                                                            ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, left2, middlex3, right4, outery1, middley2, up3])
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
            patternHorizontal: [.trailing, .leading, .middle, .trailing],
            patternVertical: [.outer, .middle, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}