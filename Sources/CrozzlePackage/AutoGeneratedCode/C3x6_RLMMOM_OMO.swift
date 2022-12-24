public class C3x6_RLMMOM_OMO {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 6
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

                                                for outery3 in 0..<wordCount {

                                                    if W.Len[outery3] >= interlockHeight + 2 {

                                                        let outery3Limit = Int(W.Len[outery3]) - Int(interlockHeight)
                                                        for outery3Pos in 1..<outery3Limit {

                                                            if (W.Start[outery3][outery3Pos + 0] == W.Start[right1][2] &&
                                                            W.Start[outery3][outery3Pos + 1] == W.End[left2][0] &&
                                                            W.Id[outery3] != W.Id[left2] &&
                                                            W.Id[outery3] != W.Id[middley2] &&
                                                            W.Id[outery3] != W.Id[right1] &&
                                                            W.Id[outery3] != W.Id[outery1]) {
                                                                //print("outery3:\(W.Start[outery3])")

                                                                for middlex3 in 0..<wordCount {

                                                                    if (W.Len[middlex3] == interlockWidth &&
                                                                        W.Start[middlex3][0] == W.Start[outery1][outery1Pos + 2] &&
                                                                        W.Start[middlex3][1] == W.Start[middley2][2] &&
                                                                        W.Start[middlex3][2] == W.Start[outery3][outery3Pos + 2] &&
                                                                        W.Id[middlex3] != W.Id[outery3] &&
                                                                        W.Id[middlex3] != W.Id[left2] &&
                                                                        W.Id[middlex3] != W.Id[middley2] &&
                                                                        W.Id[middlex3] != W.Id[right1] &&
                                                                        W.Id[middlex3] != W.Id[outery1]) {
                                                                        //print("middlex3:\(W.Start[middlex3])")

                                                                        for middlex4 in 0..<wordCount {

                                                                            if (W.Len[middlex4] == interlockWidth &&
                                                                                W.Start[middlex4][0] == W.Start[outery1][outery1Pos + 3] &&
                                                                                W.Start[middlex4][1] == W.Start[middley2][3] &&
                                                                                W.Start[middlex4][2] == W.Start[outery3][outery3Pos + 3] &&
                                                                                W.Id[middlex4] != W.Id[middlex3] &&
                                                                                W.Id[middlex4] != W.Id[outery3] &&
                                                                                W.Id[middlex4] != W.Id[left2] &&
                                                                                W.Id[middlex4] != W.Id[middley2] &&
                                                                                W.Id[middlex4] != W.Id[right1] &&
                                                                                W.Id[middlex4] != W.Id[outery1]) {
                                                                                //print("middlex4:\(W.Start[middlex4])")

                                                                                for outerx5 in 0..<wordCount {

                                                                                    if W.Len[outerx5] >= interlockWidth + 2 {

                                                                                        let outerx5Limit = Int(W.Len[outerx5]) - Int(interlockWidth)
                                                                                        for outerx5Pos in 1..<outerx5Limit {

                                                                                            if (W.Start[outerx5][outerx5Pos + 0] == W.Start[outery1][outery1Pos + 4] &&
                                                                                            W.Start[outerx5][outerx5Pos + 1] == W.Start[middley2][4] &&
                                                                                            W.Start[outerx5][outerx5Pos + 2] == W.Start[outery3][outery3Pos + 4] &&
                                                                                            W.Id[outerx5] != W.Id[middlex4] &&
                                                                                            W.Id[outerx5] != W.Id[middlex3] &&
                                                                                            W.Id[outerx5] != W.Id[outery3] &&
                                                                                            W.Id[outerx5] != W.Id[left2] &&
                                                                                            W.Id[outerx5] != W.Id[middley2] &&
                                                                                            W.Id[outerx5] != W.Id[right1] &&
                                                                                            W.Id[outerx5] != W.Id[outery1]) {
                                                                                                //print("outerx5:\(W.Start[outerx5])")

                                                                                                for middlex6 in 0..<wordCount {

                                                                                                    if (W.Len[middlex6] == interlockWidth &&
                                                                                                        W.Start[middlex6][0] == W.Start[outery1][outery1Pos + 5] &&
                                                                                                        W.Start[middlex6][1] == W.Start[middley2][5] &&
                                                                                                        W.Start[middlex6][2] == W.Start[outery3][outery3Pos + 5] &&
                                                                                                        W.Id[middlex6] != W.Id[outerx5] &&
                                                                                                        W.Id[middlex6] != W.Id[middlex4] &&
                                                                                                        W.Id[middlex6] != W.Id[middlex3] &&
                                                                                                        W.Id[middlex6] != W.Id[outery3] &&
                                                                                                        W.Id[middlex6] != W.Id[left2] &&
                                                                                                        W.Id[middlex6] != W.Id[middley2] &&
                                                                                                        W.Id[middlex6] != W.Id[right1] &&
                                                                                                        W.Id[middlex6] != W.Id[outery1]) {
                                                                                                        //print("middlex6:\(W.Start[middlex6])")

                                                                                                        if phase == 0 {
                                                                                                            shapeCount += 1
                                                                                                        }
                                                                                                        else {
                                                                                                            outerStart[index + 4] = UInt8(outerx5Pos)

                                                                                                            outerStart[index + 6] = UInt8(outery1Pos)

                                                                                                            outerStart[index + 8] = UInt8(outery3Pos)

                                                                                                            ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, left2, middlex3, middlex4, outerx5, middlex6, outery1, middley2, outery3])
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
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.trailing, .leading, .middle, .middle, .outer, .middle],
            patternVertical: [.outer, .middle, .outer],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}