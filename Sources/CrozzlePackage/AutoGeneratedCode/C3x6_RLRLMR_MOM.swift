public class C3x6_RLRLMR_MOM {
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

            for middley1 in 0..<wordCount {

                if (W.Len[middley1] == interlockHeight) {
                    //print("middley1:\(W.Start[middley1])")

                    for right1 in 0..<wordCount {

                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.Start[middley1][0] &&
                            W.Id[right1] != W.Id[middley1]) {
                            //print("right1:\(W.Start[right1])")

                            for outery2 in 0..<wordCount {

                                if W.Len[outery2] >= interlockHeight + 2 {

                                    let outery2Limit = Int(W.Len[outery2]) - Int(interlockHeight)
                                    for outery2Pos in 1..<outery2Limit {

                                        if (W.Start[outery2][outery2Pos + 0] == W.Start[right1][1] &&
                                        W.Id[outery2] != W.Id[right1] &&
                                        W.Id[outery2] != W.Id[middley1]) {
                                            //print("outery2:\(W.Start[outery2])")

                                            for left2 in 0..<wordCount {

                                                if (W.Len[left2] >= interlockWidth &&
                                                    W.End[left2][2] == W.Start[middley1][1] &&
                                                    W.End[left2][1] == W.Start[outery2][outery2Pos + 1] &&
                                                    W.Id[left2] != W.Id[outery2] &&
                                                    W.Id[left2] != W.Id[right1] &&
                                                    W.Id[left2] != W.Id[middley1]) {
                                                    //print("left2:\(W.Start[left2])")

                                                    for middley3 in 0..<wordCount {

                                                        if (W.Len[middley3] == interlockHeight &&
                                                            W.Start[middley3][0] == W.Start[right1][2] &&
                                                            W.Start[middley3][1] == W.End[left2][0] &&
                                                            W.Id[middley3] != W.Id[left2] &&
                                                            W.Id[middley3] != W.Id[outery2] &&
                                                            W.Id[middley3] != W.Id[right1] &&
                                                            W.Id[middley3] != W.Id[middley1]) {
                                                            //print("middley3:\(W.Start[middley3])")

                                                            for right3 in 0..<wordCount {

                                                                if (W.Len[right3] >= interlockWidth &&
                                                                    W.Start[right3][0] == W.Start[middley1][2] &&
                                                                    W.Start[right3][1] == W.Start[outery2][outery2Pos + 2] &&
                                                                    W.Start[right3][2] == W.Start[middley3][2] &&
                                                                    W.Id[right3] != W.Id[middley3] &&
                                                                    W.Id[right3] != W.Id[left2] &&
                                                                    W.Id[right3] != W.Id[outery2] &&
                                                                    W.Id[right3] != W.Id[right1] &&
                                                                    W.Id[right3] != W.Id[middley1]) {
                                                                    //print("right3:\(W.Start[right3])")

                                                                    for left4 in 0..<wordCount {

                                                                        if (W.Len[left4] >= interlockWidth &&
                                                                            W.End[left4][2] == W.Start[middley1][3] &&
                                                                            W.End[left4][1] == W.Start[outery2][outery2Pos + 3] &&
                                                                            W.End[left4][0] == W.Start[middley3][3] &&
                                                                            W.Id[left4] != W.Id[right3] &&
                                                                            W.Id[left4] != W.Id[middley3] &&
                                                                            W.Id[left4] != W.Id[left2] &&
                                                                            W.Id[left4] != W.Id[outery2] &&
                                                                            W.Id[left4] != W.Id[right1] &&
                                                                            W.Id[left4] != W.Id[middley1]) {
                                                                            //print("left4:\(W.Start[left4])")

                                                                            for middlex5 in 0..<wordCount {

                                                                                if (W.Len[middlex5] == interlockWidth &&
                                                                                    W.Start[middlex5][0] == W.Start[middley1][4] &&
                                                                                    W.Start[middlex5][1] == W.Start[outery2][outery2Pos + 4] &&
                                                                                    W.Start[middlex5][2] == W.Start[middley3][4] &&
                                                                                    W.Id[middlex5] != W.Id[left4] &&
                                                                                    W.Id[middlex5] != W.Id[right3] &&
                                                                                    W.Id[middlex5] != W.Id[middley3] &&
                                                                                    W.Id[middlex5] != W.Id[left2] &&
                                                                                    W.Id[middlex5] != W.Id[outery2] &&
                                                                                    W.Id[middlex5] != W.Id[right1] &&
                                                                                    W.Id[middlex5] != W.Id[middley1]) {
                                                                                    //print("middlex5:\(W.Start[middlex5])")

                                                                                    for right6 in 0..<wordCount {

                                                                                        if (W.Len[right6] >= interlockWidth &&
                                                                                            W.Start[right6][0] == W.Start[middley1][5] &&
                                                                                            W.Start[right6][1] == W.Start[outery2][outery2Pos + 5] &&
                                                                                            W.Start[right6][2] == W.Start[middley3][5] &&
                                                                                            W.Id[right6] != W.Id[middlex5] &&
                                                                                            W.Id[right6] != W.Id[left4] &&
                                                                                            W.Id[right6] != W.Id[right3] &&
                                                                                            W.Id[right6] != W.Id[middley3] &&
                                                                                            W.Id[right6] != W.Id[left2] &&
                                                                                            W.Id[right6] != W.Id[outery2] &&
                                                                                            W.Id[right6] != W.Id[right1] &&
                                                                                            W.Id[right6] != W.Id[middley1]) {
                                                                                            //print("right6:\(W.Start[right6])")

                                                                                            if phase == 0 {
                                                                                                shapeCount += 1
                                                                                            }
                                                                                            else {
                                                                                                outerStart[index + 7] = UInt8(outery2Pos)

                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, left2, right3, left4, middlex5, right6, middley1, outery2, middley3])
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
            patternHorizontal: [.trailing, .leading, .trailing, .leading, .middle, .trailing],
            patternVertical: [.middle, .outer, .middle],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}